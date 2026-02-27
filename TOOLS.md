# TOOLS.md - Local Notes

Skills define _how_ tools work. This file is for _your_ specifics — the stuff that's unique to your setup.

## What Goes Here

Things like:

- Camera names and locations
- SSH hosts and aliases
- Preferred voices for TTS
- Speaker/room names
- Device nicknames
- Anything environment-specific

## Examples

```markdown
### Cameras

- living-room → Main area, 180° wide angle
- front-door → Entrance, motion-triggered

### SSH

- home-server → 192.168.1.100, user: admin

### TTS

- Preferred voice: "Nova" (warm, slightly British)
- Default speaker: Kitchen HomePod
```

## Why Separate?

Skills are shared. Your setup is yours. Keeping them apart means you can update skills without losing your notes, and share skills without leaking your infrastructure.

---

## SSH — WordPress Server

- **Host alias:** `prefrontalclub`
- **Connection:** `ssh prefrontalclub` (wnbpapte@50.6.245.9)
- **WP-CLI:** `/usr/local/bin/wp` (v2.9.0)
- **Key:** `~/.ssh/id_ed25519`

### WP-CLI Examples:
```bash
ssh prefrontalclub "wp option get siteurl"
ssh prefrontalclub "wp post list --post_type=page --fields=ID,post_title"
ssh prefrontalclub "wp plugin list"
ssh prefrontalclub "wp cache flush"
ssh prefrontalclub "wp db query 'SELECT COUNT(*) FROM wp_posts'"
```

**Note:** WP path is pre-configured via `~/.wp-cli/config.yml` on the server — no `--path` needed.

Use WP-CLI via SSH for operations not covered by the MCP server (database queries, plugin management, cache, cron, etc.).
