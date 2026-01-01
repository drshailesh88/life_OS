#!/bin/bash

###############################################################################
# Voice Inbox Processor
# Watches voice-inbox folder for new audio files, transcribes them,
# and triggers brain-dump skill
###############################################################################

VOICE_INBOX="${HOME}/life_OS/voice-inbox"
TRANSCRIPTS_DIR="${VOICE_INBOX}/transcripts"
PROCESSED_DIR="${VOICE_INBOX}/processed"
SCRIBERR_URL="${SCRIBERR_URL:-http://localhost:3000}"

# Colors for output
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

# Create directories if they don't exist
mkdir -p "$VOICE_INBOX" "$TRANSCRIPTS_DIR" "$PROCESSED_DIR"

echo -e "${BLUE}🎤 Voice Inbox Processor Starting...${NC}"
echo -e "${BLUE}Watching: ${VOICE_INBOX}${NC}"
echo

# Function to transcribe audio file
transcribe_audio() {
    local audio_file="$1"
    local filename=$(basename "$audio_file")
    local base="${filename%.*}"
    local transcript_file="${TRANSCRIPTS_DIR}/${base}.txt"

    echo -e "${YELLOW}📝 Transcribing: ${filename}${NC}"

    # Check if Scriberr is available
    if command -v curl &> /dev/null; then
        # Use Scriberr API if available
        response=$(curl -s -X POST "${SCRIBERR_URL}/api/transcribe" \
            -F "audio=@${audio_file}" 2>&1)

        if [ $? -eq 0 ]; then
            echo "$response" > "$transcript_file"
            echo -e "${GREEN}✓ Transcribed to: ${transcript_file}${NC}"
            return 0
        else
            echo -e "${RED}✗ Scriberr transcription failed${NC}"
        fi
    fi

    # Fallback: Create placeholder for manual transcription
    echo -e "${YELLOW}⚠ Scriberr not available. Manual transcription required.${NC}"
    echo "[Audio file: ${filename}]" > "$transcript_file"
    echo "" >> "$transcript_file"
    echo "=== MANUAL TRANSCRIPTION NEEDED ===" >> "$transcript_file"
    echo "" >> "$transcript_file"
    echo "Listen to the audio and type your transcription here..." >> "$transcript_file"

    return 1
}

# Function to process transcript with brain-dump skill
process_transcript() {
    local transcript_file="$1"
    local filename=$(basename "$transcript_file")

    echo -e "${BLUE}🧠 Processing with brain-dump skill...${NC}"

    # Read transcript content
    transcript_content=$(cat "$transcript_file")

    # Create a temp file with brain-dump prompt
    temp_prompt=$(mktemp)
    cat > "$temp_prompt" << EOF
Use the brain-dump skill on this voice transcript:

${transcript_content}

Process all thoughts, tasks, ideas, and notes from this voice recording.
EOF

    echo -e "${GREEN}✓ Ready for Claude Code processing${NC}"
    echo -e "${YELLOW}→ You can now run: claude code < ${temp_prompt}${NC}"
    echo

    # Note: Actual Claude Code integration would happen here if running in automated mode
    # For now, we create the prompt file for manual/automated triggering
}

# Function to move processed audio
archive_audio() {
    local audio_file="$1"
    local filename=$(basename "$audio_file")
    mv "$audio_file" "${PROCESSED_DIR}/${filename}"
    echo -e "${GREEN}✓ Archived to: ${PROCESSED_DIR}/${filename}${NC}"
}

# Main watch loop
if command -v inotifywait &> /dev/null; then
    # Linux: Use inotifywait
    echo -e "${GREEN}Using inotifywait for file watching${NC}"
    inotifywait -m -e close_write --format '%w%f' "${VOICE_INBOX}" |
    while read -r audio_file; do
        # Check if it's an audio file
        if [[ "$audio_file" =~ \.(mp3|m4a|wav|ogg|flac|aac)$ ]]; then
            echo
            echo -e "${BLUE}═══════════════════════════════════════${NC}"
            echo -e "${BLUE}New audio file detected!${NC}"
            echo -e "${BLUE}═══════════════════════════════════════${NC}"

            # Transcribe
            if transcribe_audio "$audio_file"; then
                # Get transcript path
                filename=$(basename "$audio_file")
                base="${filename%.*}"
                transcript_file="${TRANSCRIPTS_DIR}/${base}.txt"

                # Process with brain-dump
                process_transcript "$transcript_file"
            fi

            # Archive the audio file
            archive_audio "$audio_file"

            echo -e "${BLUE}═══════════════════════════════════════${NC}"
            echo
        fi
    done

elif command -v fswatch &> /dev/null; then
    # macOS: Use fswatch
    echo -e "${GREEN}Using fswatch for file watching${NC}"
    fswatch -0 "${VOICE_INBOX}" |
    while read -d "" audio_file; do
        # Check if it's an audio file
        if [[ "$audio_file" =~ \.(mp3|m4a|wav|ogg|flac|aac)$ ]] && [[ -f "$audio_file" ]]; then
            echo
            echo -e "${BLUE}═══════════════════════════════════════${NC}"
            echo -e "${BLUE}New audio file detected!${NC}"
            echo -e "${BLUE}═══════════════════════════════════════${NC}"

            # Small delay to ensure file is fully written
            sleep 1

            # Transcribe
            if transcribe_audio "$audio_file"; then
                # Get transcript path
                filename=$(basename "$audio_file")
                base="${filename%.*}"
                transcript_file="${TRANSCRIPTS_DIR}/${base}.txt"

                # Process with brain-dump
                process_transcript "$transcript_file"
            fi

            # Archive the audio file
            archive_audio "$audio_file"

            echo -e "${BLUE}═══════════════════════════════════════${NC}"
            echo
        fi
    done

else
    # Fallback: Poll directory every 10 seconds
    echo -e "${YELLOW}⚠ No file watcher available (inotifywait/fswatch)${NC}"
    echo -e "${YELLOW}Using polling mode (checks every 10 seconds)${NC}"

    while true; do
        for audio_file in "${VOICE_INBOX}"/*.{mp3,m4a,wav,ogg,flac,aac} 2>/dev/null; do
            if [ -f "$audio_file" ]; then
                echo
                echo -e "${BLUE}═══════════════════════════════════════${NC}"
                echo -e "${BLUE}New audio file detected!${NC}"
                echo -e "${BLUE}═══════════════════════════════════════${NC}"

                # Transcribe
                if transcribe_audio "$audio_file"; then
                    # Get transcript path
                    filename=$(basename "$audio_file")
                    base="${filename%.*}"
                    transcript_file="${TRANSCRIPTS_DIR}/${base}.txt"

                    # Process with brain-dump
                    process_transcript "$transcript_file"
                fi

                # Archive the audio file
                archive_audio "$audio_file"

                echo -e "${BLUE}═══════════════════════════════════════${NC}"
                echo
            fi
        done
        sleep 10
    done
fi
