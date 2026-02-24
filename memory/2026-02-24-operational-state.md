# Operational State — 2026-02-24

## Owner / Decision context
- Owner: Hadi Servat (`@servathadi`)
- Direction: move to operations; minimize owner involvement in routine workflows.
- Language preference: Persian by default.

## Platform decisions
- Phase 1 stack: WordPress as single source of truth.
- Eduma + LearnPress + WooCommerce retained.
- No immediate GHL dependency for core operations.

## Completed build state
- Internal strategy page created (private): business model / operating direction.
- Main event/course pages and templates created.
- Master Elementor event template built and published, plus two derivative templates:
  - Free webinar template
  - Volunteer intake template
- Internal team docs created (private):
  - Prefrontal notes page
  - Content Agent notes page
  - MCP Operator notes page
  - Team dashboard page linking all internal docs
  - SOP: launch an event in 10 minutes

## LearnPress state
- Non-relevant demo courses removed.
- Active courses include:
  1) Hero Journey course (LP) with full curriculum (12 lessons + 3 quizzes)
  2) Integrative psychotherapy observational course (Season 6) with 5-session curriculum
- Persian category created and used: "روان‌درمانی تلفیقی"

## Media state
- Conceptual no-text hero images generated via OpenAI image model and attached to key courses/pages.

## Agent setup
- API keys created:
  - `pfc-content-agent` (scoped)
  - `pfc-mcp-operator` (admin)
- Intended team topology:
  - Prefrontal main agent (orchestration)
  - Content agent (copy/content)
  - MCP operator (execution)

## Known operational notes
- MCP `wp_get_guide` now available and useful for runtime guidance.
- LearnPress create endpoints had been fixed after initial bug; re-test passed.
- For critical group ops: mention `@servathadi` only for blockers/approvals.
