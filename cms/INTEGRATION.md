# Resident CMS + FMAAP integration

This CMS is agent-friendly. The standard flow is:

1. **Content authoring** – Drop or edit MDX in `content/` (hero, offer, journal, contact). Each file follows the shared frontmatter schema so the build script can parse metadata.
2. **Draft intent declaration** – Run `./build.sh draft [page]`. The script declares an FMAAP intent (`/intent`) and sends the component (`/production`). FMAAP ensures the update scores above `0.7` before continuing.
3. **Resident checkpoint** – Telegram (or any resident agent) reviews the FMAAP validation. If the score is low, fix the content and rerun the draft step. Only go to step 4 once the gate is satisfied.
4. **Publish** – Run `./build.sh publish [page]`. The script reruns the draft step, builds the dist, and rsyncs into `/var/www/mumega.com/pref`. The static site now reflects the approved change.
5. **Mirror + memory** – n8n workflows should keep Mirror/Supabase updated with each MDX file and any Drive/Notion fragments. The resident assistant uses that memory to answer questions or spin new drafts.

Keep the `dist/` folder minimal and let the script rebuild it for every publish. Use the Snippets components (Hero, SectionGrid, etc.) to maintain consistent layout across pages so the model can swap hero text, pricing, or journal entries without breaking the page structure.
