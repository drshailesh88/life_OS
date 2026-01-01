#!/usr/bin/env python3
"""
Khoj MCP Server for Life OS
Provides Claude Code access to Khoj semantic search
"""

import asyncio
import json
import os
from typing import Any, Dict, List

import requests
from mcp import Server
from mcp.server.stdio import stdio_server
from mcp.types import Tool, TextContent


KHOJ_URL = os.getenv("KHOJ_URL", "http://localhost:42110")


class KhojMCP:
    """MCP server for Khoj AI integration"""

    def __init__(self):
        self.server = Server("khoj-mcp")
        self.setup_handlers()

    def setup_handlers(self):
        """Register MCP handlers"""

        @self.server.list_tools()
        async def list_tools() -> List[Tool]:
            return [
                Tool(
                    name="khoj_search",
                    description="Search across all your knowledge (notes, documents, journals) using semantic search",
                    inputSchema={
                        "type": "object",
                        "properties": {
                            "query": {
                                "type": "string",
                                "description": "What to search for"
                            },
                            "limit": {
                                "type": "integer",
                                "description": "Number of results (default: 5)",
                                "default": 5
                            }
                        },
                        "required": ["query"]
                    }
                ),
                Tool(
                    name="khoj_chat",
                    description="Chat with your knowledge base - ask questions and get answers based on your own notes and documents",
                    inputSchema={
                        "type": "object",
                        "properties": {
                            "question": {
                                "type": "string",
                                "description": "Question to ask"
                            },
                            "context": {
                                "type": "string",
                                "description": "Additional context for the question",
                                "default": ""
                            }
                        },
                        "required": ["question"]
                    }
                ),
                Tool(
                    name="khoj_research",
                    description="Deep research mode - combines your personal knowledge with web search for comprehensive answers",
                    inputSchema={
                        "type": "object",
                        "properties": {
                            "topic": {
                                "type": "string",
                                "description": "Topic to research"
                            },
                            "focus": {
                                "type": "string",
                                "description": "Specific aspect to focus on",
                                "default": ""
                            }
                        },
                        "required": ["topic"]
                    }
                ),
            ]

        @self.server.call_tool()
        async def call_tool(name: str, arguments: Dict[str, Any]) -> List[TextContent]:
            if name == "khoj_search":
                return await self.search(arguments)
            elif name == "khoj_chat":
                return await self.chat(arguments)
            elif name == "khoj_research":
                return await self.research(arguments)
            else:
                raise ValueError(f"Unknown tool: {name}")

    async def search(self, args: Dict[str, Any]) -> List[TextContent]:
        """Semantic search across knowledge base"""
        query = args["query"]
        limit = args.get("limit", 5)

        try:
            response = requests.get(
                f"{KHOJ_URL}/api/search",
                params={"q": query, "n": limit, "t": "markdown"}
            )
            response.raise_for_status()

            results = response.json()

            if not results:
                return [TextContent(
                    type="text",
                    text=f"No results found for: {query}"
                )]

            # Format results
            output = f"# Search Results: {query}\n\n"

            for i, result in enumerate(results[:limit], 1):
                output += f"## Result {i}\n\n"
                output += f"**File:** {result.get('file', 'Unknown')}\n\n"
                output += f"{result.get('content', '')}\n\n"
                output += f"**Relevance:** {result.get('score', 0):.2f}\n\n"
                output += "---\n\n"

            return [TextContent(type="text", text=output)]

        except Exception as e:
            return [TextContent(
                type="text",
                text=f"Error searching Khoj: {str(e)}"
            )]

    async def chat(self, args: Dict[str, Any]) -> List[TextContent]:
        """Chat with knowledge base"""
        question = args["question"]
        context = args.get("context", "")

        try:
            payload = {
                "q": question,
                "context": context
            }

            response = requests.post(
                f"{KHOJ_URL}/api/chat",
                json=payload
            )
            response.raise_for_status()

            answer = response.json().get("response", "No response")

            output = f"# Question: {question}\n\n"
            if context:
                output += f"**Context:** {context}\n\n"
            output += f"## Answer\n\n{answer}\n"

            return [TextContent(type="text", text=output)]

        except Exception as e:
            return [TextContent(
                type="text",
                text=f"Error chatting with Khoj: {str(e)}"
            )]

    async def research(self, args: Dict[str, Any]) -> List[TextContent]:
        """Deep research mode"""
        topic = args["topic"]
        focus = args.get("focus", "")

        try:
            query = f"/research {topic}"
            if focus:
                query += f" focusing on {focus}"

            payload = {"q": query}

            response = requests.post(
                f"{KHOJ_URL}/api/chat",
                json=payload
            )
            response.raise_for_status()

            research = response.json().get("response", "No research available")

            output = f"# Research: {topic}\n\n"
            if focus:
                output += f"**Focus:** {focus}\n\n"
            output += f"{research}\n"

            return [TextContent(type="text", text=output)]

        except Exception as e:
            return [TextContent(
                type="text",
                text=f"Error researching: {str(e)}"
            )]


async def main():
    """Run the MCP server"""
    khoj_mcp = KhojMCP()

    async with stdio_server() as (read_stream, write_stream):
        await khoj_mcp.server.run(
            read_stream,
            write_stream,
            khoj_mcp.server.create_initialization_options()
        )


if __name__ == "__main__":
    asyncio.run(main())
