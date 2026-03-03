# Prefrontal

Customer-facing AI assistant for **باشگاه پری‌فرونتال** (Prefrontal Club), powered by [OpenClaw](https://openclaw.ai).

## What it does

Prefrontal manages the WordPress site at [prefrontalclub.com](https://prefrontalclub.com) through Telegram. It can:

- Manage pages, posts, and media
- Edit Elementor templates and layouts
- Update SEO settings and metadata
- Modify custom CSS and site options
- Handle menus, widgets, and navigation
- Generate and manage images
- Take site screenshots

## Architecture

```
Telegram (@prefrontal_mumega_bot)
    ↓
OpenClaw Gateway (multi-agent routing)
    ↓
Prefrontal Agent (openai-codex/gpt-5.1)
    ↓
mcporter → SitePilot AI MCP Server
    ↓
WordPress REST API (prefrontalclub.com)
```

## Stack

| Component | Details |
|-----------|---------|
| Orchestrator | OpenClaw v2026.2.22 |
| Model | OpenAI Codex gpt-5.1 (via OAuth) |
| Channel | Telegram Bot API |
| MCP Server | SitePilot AI (100+ WordPress tools) |
| CMS | WordPress + Elementor |
| Host | Hetzner VPS (Helsinki) |

## Operational docs (new)

- `docs/ROADMAP.md` — MVP to automation roadmap
- `docs/event-default-spec-v1.md` — canonical event ingestion defaults
- `docs/automation/woo-telegram-order-handoff-v1.md` — payment-to-telegram access handoff
- `docs/github-issue-templates.md` — issue structure for event/update/improvement workflows
- `docs/issues-needed-from-team.md` — open questions/blockers for team answers

## Workspace files

| File | Purpose |
|------|---------|
| `SOUL.md` | Agent identity, personality, and MCP usage instructions |
| `AGENTS.md` | Workspace rules and safety guidelines |
| `TOOLS.md` | Available tool documentation |
| `IDENTITY.md` | Agent persona configuration |
| `HEARTBEAT.md` | Periodic health check instructions |
| `BOOTSTRAP.md` | First-run setup instructions |
| `brand/` | Brand assets and guidelines |
| `cms/` | CMS-related configs and templates |
| `memory/` | Agent memory and context across sessions |

## Setup

This agent runs as part of a multi-agent OpenClaw gateway. Configuration lives in `~/.openclaw/openclaw.json` under `agents.list`.

```json
{
  "id": "prefrontal",
  "workspace": "/home/mumega/clawd-prefrontal",
  "model": "openai-codex/gpt-5.1",
  "sandbox": { "mode": "off" },
  "tools": { "deny": ["process", "browser", "canvas", "nodes"] }
}
```

Telegram routing is handled via top-level bindings:

```json
{
  "match": { "channel": "telegram", "accountId": "prefrontal" },
  "agentId": "prefrontal"
}
```
