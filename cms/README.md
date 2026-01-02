# Prefrontal CMS (resident + FMAAP pipeline)

This folder is the **machine layer** for Prefrontal Club. Content is authored in Markdown/MDX, validated via FMAAP, and then compiled into the static site that lives at `mumega.com/pref`. The goal is to keep the site consistent even when the model (or another agent) edits pages: every change goes through the resident-CMS → FMAAP gate → deploy loop.

## Structure

- `content/` – MDX fragments for each public page (home, offer, journal categories, contact). Keep frontmatter consistent so the deploy script can build navigation automatically.
- `snippets/` – reusable sections (hero, CTA strip, testimonial grid) that resident-CMS can insert into pages.
- `config/site.json` – shared metadata (title, colors, default CTA) used by the build pipeline.
- `build.sh` – small script that runs `resident-cms draft`, triggers validation (FMAAP), and copies the generated `dist/` folder into the `mumega.com/pref` deploy workspace.
- `fmaap/` – local configuration that points at the canonical hub (`http://localhost:8845`). Whenever you change a page, submit the task to FMAAP for coherence validation before publishing.

## Workflow (model-friendly)

1. Draft content in `/content`. Use the existing frontmatter schema (`title`, `hero`, `cta`, `category`, `language`).
2. Run `./build.sh draft --page=<page>` to stage the draft.
3. The script declares the intent in FMAAP, pushes the component, and waits for validation. A warning is emitted if the coherence score drops below 0.7.
4. Upon approval, the script copies `dist/` into `/var/www/mumega.com/pref` (or whichever deploy path is configured). Use `resident-cms publish` to finalize.

Automations (Telegram, Mirror, n8n) already push source fragments into this folder, so you can treat it as the single source of truth and let FMAAP guard consistency.
