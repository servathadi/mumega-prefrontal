# Prefrontal v2 — Infrastructure Plan (Draft, Not Published)

Status: Draft-only (no public publish)
Owner: Prefrontal

## Goal
Build conversion + retention infrastructure before public launch.

## v2 Core Blocks
1. Lead Magnet Funnel (Brochure PDF)
2. Nurture Automation (3-email Persian sequence)
3. Cohort Program Structure (L1/L2/L3)
4. Trust Layer (credentials/testimonials)
5. Event/Course/Book segmentation + reporting

## Data Model (minimal)
- contact_id
- name
- email
- telegram_id
- source_channel (telegram/site/eventbrite)
- lead_magnet (brochure/free-book)
- tags[] (event-registrant/course-buyer/free-book-download/brochure-download)
- lifecycle_stage (lead/nurture/event-attendee/cohort-member/alumni)
- last_activity_at

## Automation Flow v2
1) Trigger: brochure download / free-book checkout / event registration
2) Tag assignment + lifecycle update
3) Email sequence (D0, D2, D5)
4) CTA routing:
   - Event page / Eventbrite
   - Cohort waitlist
   - Membership offer
5) Weekly digest + reactivation branch

## Deliverables (Infra only)
- [ ] WP draft pages created (not published)
- [ ] Mailchimp segments + tags map finalized
- [ ] Worker webhook schema + HMAC standard
- [ ] GitHub ops checklist and runbook
- [ ] KPI dashboard schema (CSV/Sheet/DB-ready)

## Security/Compliance
- Secrets only via env
- HMAC validation for inbound webhooks
- PII minimization and role-based visibility
- No token exposure in logs/messages
