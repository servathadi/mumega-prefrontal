# Repository Guidelines

## Project Structure & Module Organization
- `cms/` is the working CMS layer for the site. Content lives in `cms/content/` as page-level MDX (`home.mdx`, `offer.mdx`, `journal.mdx`, `contact.mdx`).
- Reusable sections sit in `cms/snippets/` (e.g., `Hero.mdx`, `SectionGrid.mdx`). Import these from page MDX.
- Shared metadata and deploy settings live in `cms/config/site.json`.
- FMAAP integration config is under `cms/fmaap/`.
- `brand/` stores static brand assets and documents; it is not part of the build.

## Build, Test, and Development Commands
- `cd cms`
- `./build.sh draft <page>`: calls FMAAP, stages a draft, and writes `dist/<page>.mdx` and `dist/<page>.html`.
- `./build.sh publish <page>`: runs the draft step, then rsyncs `dist/` to the deploy path from `config/site.json` (default `/var/www/mumega.com/pref`).
- There is no local dev server in this repo; open `cms/dist/<page>.html` for a quick preview.

## Coding Style & Naming Conventions
- Use YAML frontmatter with consistent keys (e.g., `title`, `hero`, `cta`, `category`, `language`, `draft`). Keep 2-space indentation in YAML/JSON.
- Page files are lowercase and match the route name (`home.mdx`, `offer.mdx`).
- Snippet components use PascalCase filenames and imports (`Hero`, `SectionGrid`).

## Testing Guidelines
- No automated test suite is present. The primary validation gate is FMAAP (coherence score must pass).
- After `draft`, spot-check the generated `cms/dist/<page>.html` and verify frontmatter-driven sections render as expected.

## Commit & Pull Request Guidelines
- This directory does not contain Git history. Follow your team standard. If you need a default, use short, imperative subjects that mention the page, e.g., `cms: update home hero`.
- PRs should summarize the page(s) touched and include screenshots or links to the generated `dist/<page>.html` previews when content changes.

## Configuration & Deployment Notes
- `cms/build.sh` uses `curl`, `rsync`, and `sudo`; ensure local FMAAP is reachable at `http://localhost:8845` before publishing.
- Keep `cms/dist/` ephemeral; the script rebuilds it on every draft/publish.
