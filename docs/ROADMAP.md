# Prefrontal Roadmap (MVP → Automation)

## North Star
Mirror Telegram operations into WordPress reliably, monetize courses through WooCommerce/LearnPress, and keep GitHub as operational single source of truth.

## Phase 0 — Foundation (Now)
- [x] Define Event Default Spec v1
- [x] Define Woo → Telegram handoff flow (manual access grant)
- [x] Create GitHub issue templates for event/new, event/update, improvements
- [x] Confirm GitHub connectivity from agent

## Phase 1 — Revenue MVP (Immediate)
1. Remove/archive Woo sample products from public catalog
2. Build active sellable course catalog from Telegram offerings
3. Enforce checkout required fields: name, email, phone, telegram_id
4. [x] Activate Woo webhook handoff to Telegram ops chat (Worker deployed, WP webhook pending)
5. Standardize order note lifecycle:
   - `ADD_TO_TELEGRAM_PENDING`
   - `Telegram Access Granted`

## Phase 2 — Content Mirror Reliability
1. Channel-driven Event ingestion (`@prefrontalclub`)
2. Dedup/update logic for rescheduled event posts
3. Featured image and CTA defaults
4. One small site improvement logged per import cycle

## Phase 3 — Automation Hardening
1. [x] Worker endpoint — Cloudflare Worker `prefrontal-woo-handoff` deployed
2. Signed webhook validation (HMAC)
3. Retry + idempotency + dead-letter logging
4. Daily reconciliation job (orders vs telegram grants)

## Phase 4 — Reporting & Scale
1. Weekly ops digest to Telegram + GitHub
2. GA4/GSC integration for event/course conversion funnel
3. Stripe test → production cutover checklist
4. Expand to additional channels/domains

## Execution Ownership
- Orchestration: Prefrontal
- Implementation worker: Claude Code (ACP)
- Business approvals: Hadi / team
