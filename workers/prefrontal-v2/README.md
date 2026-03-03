# prefrontal-v2 worker scaffold

Purpose: webhook/router infra for Prefrontal v2 funnels (not deployed yet).

## Planned endpoints
- POST /webhook/woo-order
- POST /webhook/eventbrite-registration
- POST /webhook/brochure-download

## Behavior
- Verify HMAC
- Normalize payload
- Assign tags/lifecycle
- Forward notification to Telegram ops
- Queue async email trigger marker

## Env needed
- TELEGRAM_BOT_TOKEN
- TELEGRAM_OPS_CHAT_ID
- WOO_WEBHOOK_SECRET
- EVENTBRITE_WEBHOOK_SECRET
- BROCHURE_WEBHOOK_SECRET
