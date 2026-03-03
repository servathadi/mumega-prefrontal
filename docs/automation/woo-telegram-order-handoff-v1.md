# Woo → Telegram Order Handoff v1 (MVP Base)

## Objective
Collect payment first, then hand off each paid order to Telegram ops for manual access grant.
Future-ready for Cloudflare automation.

## Required buyer fields (checkout)
- Full Name
- Email
- Phone Number
- Telegram ID/Username (required, e.g. @username)

## MVP Flow (now)
1. User purchases course/product on WooCommerce.
2. On order status = `processing` or `completed`, create handoff payload.
3. Send order summary to Telegram ops chat (this group) for manual action.
4. Admin adds user to target Telegram group/channel.
5. Admin updates order note: `Telegram Access Granted`.

## Handoff payload format
- Order ID
- Product/Course title
- Amount + currency
- Buyer name
- Email
- Phone
- Telegram ID
- Payment status
- Timestamp
- Action: `ADD_TO_TELEGRAM_PENDING`

## WordPress-side implementation options
### Option A (fastest in WordPress)
- WooCommerce checkout field plugin/custom code to add Telegram ID field
- Hook: `woocommerce_order_status_processing` and `woocommerce_order_status_completed`
- Send webhook to automation endpoint (Cloudflare Worker or OpenClaw endpoint)

### Option B (Cloudflare-ready)
- WP sends signed webhook to Cloudflare Worker
- Worker validates signature, logs to KV/DB, posts formatted message to Telegram
- Later: Worker can auto-invite if Telegram permissions allow

## Telegram message template
"🔔 New Paid Order\nOrder: #{order_id}\nItem: {item}\nAmount: {amount} {currency}\nName: {name}\nEmail: {email}\nPhone: {phone}\nTelegram: {telegram_id}\nStatus: {status}\nAction: Add user to Telegram access group"

## Security
- Never expose payment tokens in Telegram.
- Sign outgoing webhook payloads (HMAC).
- Store secrets in `.env` only.

## Env keys needed
- WOO_WEBHOOK_SECRET
- TELEGRAM_BOT_TOKEN
- TELEGRAM_OPS_CHAT_ID
- ORDER_NOTIFY_ENABLED=true
- ORDER_REQUIRED_FIELDS=name,email,phone,telegram_id

## Manual test run checklist
- [ ] Create test product (or existing course)
- [ ] Place test order (Stripe test mode)
- [ ] Verify required fields validation
- [ ] Verify Telegram notification received
- [ ] Verify admin can mark `Telegram Access Granted`
