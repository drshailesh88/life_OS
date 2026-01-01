# Voice Processing Automation

Automatically transcribe voice recordings and process them with Claude's brain-dump skill.

## How It Works

```
Voice Recording → voice-inbox/ → Transcribe (Scriberr) →
transcripts/ → brain-dump skill → Notion databases
```

## Setup

### Option 1: With Scriberr (Recommended)

**1. Install Scriberr:**
```bash
docker run -d \
  --name scriberr \
  -p 3000:3000 \
  -v ~/life_OS/voice-inbox:/watch \
  -v scriberr-data:/data \
  rishikanthc/scriberr:latest
```

**2. Start the watcher:**
```bash
chmod +x automation/voice-processor/watch-and-transcribe.sh
./automation/voice-processor/watch-and-transcribe.sh
```

**3. Record voice notes:**
- Save audio files to: `~/life_OS/voice-inbox/`
- Supported formats: mp3, m4a, wav, ogg, flac, aac

**4. Processing happens automatically:**
- Audio → transcribed to text
- Transcript → processed with brain-dump
- Results → Notion databases
- Audio → archived to processed/

### Option 2: Manual Transcription

If Scriberr isn't available, the watcher creates transcript templates:

**1. Start the watcher:**
```bash
./automation/voice-processor/watch-and-transcribe.sh
```

**2. Drop audio in voice-inbox/**

**3. Edit the transcript file:**
- Open: `voice-inbox/transcripts/your-file.txt`
- Manually type the transcription
- Save

**4. Process with Claude:**
```bash
cat voice-inbox/transcripts/your-file.txt | claude code
```

Then say: "Use the brain-dump skill on this transcript"

## Mobile Voice Capture

### iOS:
**Voice Memos App:**
1. Record voice note
2. Share → Files
3. Save to: iCloud Drive/life_OS/voice-inbox/

**Shortcuts App:**
Create automation:
- Trigger: When I say "[phrase]"
- Action: Record audio, save to voice-inbox folder

### Android:
**Voice Recorder App:**
1. Record voice note
2. Share → Files
3. Save to: Google Drive/life_OS/voice-inbox/

**Sync to computer:**
- Use cloud storage sync (iCloud, Google Drive, Dropbox)
- Or use Syncthing for local sync

## Voice Recording Tips

**For Best Transcription:**
- Speak clearly and at moderate pace
- Minimize background noise
- Use a good microphone (phone is fine)
- Pause briefly between thoughts

**Content Structure:**
Start with context, then speak freely:
```
"Brain dump for today, January 8th.

Need to call the dentist about my crown appointment.
Also been thinking about that newsletter idea...
[continue thoughts]
```

**What Works Well:**
- ✅ Task capture: "Need to..."
- ✅ Ideas: "Thinking about..."
- ✅ Decisions: "Decided to..."
- ✅ Observations: "Noticed that..."

## Automation Options

### Run as Background Service

**Linux (systemd):**
Create: `/etc/systemd/system/voice-processor.service`
```ini
[Unit]
Description=Life OS Voice Processor
After=network.target

[Service]
Type=simple
User=youruser
WorkingDirectory=/home/youruser/life_OS
ExecStart=/home/youruser/life_OS/automation/voice-processor/watch-and-transcribe.sh
Restart=always

[Install]
WantedBy=multi-user.target
```

Enable:
```bash
sudo systemctl enable voice-processor
sudo systemctl start voice-processor
```

**macOS (launchd):**
Create: `~/Library/LaunchAgents/com.lifeos.voiceprocessor.plist`
```xml
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
    <key>Label</key>
    <string>com.lifeos.voiceprocessor</string>
    <key>ProgramArguments</key>
    <array>
        <string>/Users/youruser/life_OS/automation/voice-processor/watch-and-transcribe.sh</string>
    </array>
    <key>RunAtLoad</key>
    <true/>
    <key>KeepAlive</key>
    <true/>
</dict>
</plist>
```

Load:
```bash
launchctl load ~/Library/LaunchAgents/com.lifeos.voiceprocessor.plist
```

## Troubleshooting

**Transcription not working:**
- Check Scriberr is running: `docker ps | grep scriberr`
- View logs: `docker logs scriberr`
- Test API: `curl http://localhost:3000/health`

**File watcher not detecting:**
- Linux: Install inotify-tools: `apt install inotify-tools`
- macOS: Install fswatch: `brew install fswatch`
- Both: Script falls back to polling mode

**Claude integration not automatic:**
- Current version requires manual trigger
- Future: Will integrate with Claude Code API
- Workaround: Run prompted command shown in output

## Advanced: n8n Integration

Connect to n8n for advanced workflows:

**Example workflow:**
1. Audio file detected
2. Transcribe with Scriberr
3. Send to Claude API (brain-dump)
4. Parse results
5. Create Notion entries via API
6. Send notification

See: `automation/n8n-workflows/voice-to-notion.json`

## Privacy Note

All processing is local by default:
- Scriberr runs on your machine
- Transcripts stored locally
- Only Notion API calls leave your network

For maximum privacy:
- Self-host everything (Scriberr, Notion alternatives)
- Use local LLMs (Ollama + Claude Code alternative)
- Keep voice-inbox on encrypted drive
