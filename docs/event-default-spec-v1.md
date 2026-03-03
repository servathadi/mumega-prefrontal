# Event Default Spec v1 (Prefrontal MVP)

## Goal
Mirror Telegram event posts into prefrontalclub.com quickly, consistently, and with purchase-ready CTA.

## Source of Truth
1. WordPress (published Event)
2. GitHub issue log (operational trace)
3. Telegram source post (raw input)

## Intake Rules (Telegram -> Event)
A post is treated as an Event when at least 2 of these are present:
- Event markers: 🛑 / ⭕️ / «وبینار» / «دوره» / «جلسه»
- A date/time expression
- Instructor or organizer mention
- Registration cue (WhatsApp/URL/form)

## Required Fields
- title_fa
- summary_fa (2-3 lines)
- body_fa (full details)
- start_at (UTC + local display)
- timezone labels (PT/ET/CET/Tehran if present)
- organizer (default: باشگاه پریفرونتال)
- speaker(s)
- registration_url (default WhatsApp fallback)
- featured_image
- source_message_link or source_message_id

## Defaults
- status: publish (or draft if missing date)
- language: fa
- category: event/webinar/course-event (auto detect)
- CTA text: «ثبت‌نام / اطلاعات بیشتر»
- CTA URL fallback: https://wa.me/17788585719
- slug: Persian readable slug (shortened)

## Update Rules
If a new Telegram post appears to update an existing event (same title/speaker/window):
- Update existing event instead of creating duplicate
- Add note in content: «آخرین بروزرسانی: ...»
- Keep canonical URL stable

## Image Rules
- Use poster as featured image
- If no image available: use default branded placeholder
- Alt text pattern: "پوستر رویداد: <title>"

## Commerce Rules (MVP)
- Free events: CTA -> WhatsApp or form
- Paid training: create/attach LearnPress/Woo purchase path
- Keep dual pricing in content when needed (IRT/CAD)

## SEO Defaults
- Meta title: <Event Title> | باشگاه پریفرونتال
- Meta description: first 140-160 chars of summary
- OG image: featured image

## QA Checklist (Before Publish)
- [ ] Correct post type (Event, not blog post)
- [ ] Time/date verified
- [ ] Featured image set
- [ ] CTA works
- [ ] Mobile check
- [ ] Appears in /رویدادها/

## Continuous Improvement (1 per cycle)
For each processed event, do one small improvement and log it:
- menu label cleanup
- broken link fix
- event card consistency
- SEO metadata cleanup
- speed/UX small fix

## Logging
For each event operation, create/update GitHub issue with:
- WP Event ID + URL
- Source message reference
- Action (new/update)
- Improvement done
- Blockers (if any)
