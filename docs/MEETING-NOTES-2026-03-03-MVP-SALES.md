# صورتجلسه — MVP فروش باشگاه پریفرونتال

تاریخ: 2026-03-03 (UTC)

## 1) انجام‌شده (Done)
- ساختار GitHub + roadmap + issue backlog کامل شد.
- دو محصول اولیه ساخته شد:
  - دوره آفلاین میتولوژی (Product ID: 14684)
  - دوره آفلاین تحلیل رفتار متقابل (Product ID: 14687)
- صفحات WooCommerce فعال و پابلیک شدند:
  - /cart/
  - /checkout/
  - /my-account/
- فیلد اجباری Telegram ID در Checkout + پروفایل کاربر اضافه شد.
- صفحه «باشگاه اعضا» ایجاد شد:
  - https://prefrontalclub.com/members-club/
- باگ MCP مربوط به Elementor ثبت شد:
  - داخلی: issue #7
  - Vendor-facing: Digidinc/wp-ai-operator#180

## 2) موارد تاییدشده
1. اتصال Stripe به Production
2. اضافه کردن کانال هر محصول
3. اضافه شدن ربات به @prefrontalclub برای خواندن خودکار
4. اتوماسیون افزودن خریدار به گروه/کانال

## 3) تسک‌های نهایی تا اولین فروش واقعی (اولویت‌بندی)

### A) پرداخت و فروش (بحرانی)
1. Stripe Production go-live (کلیدها + webhook + تست پرداخت واقعی)
2. تایید نهایی قیمت/ارز هر محصول (IRT/CAD/USD)

### B) Fulfillment دسترسی (بحرانی)
3. Mapping محصول ↔ کانال/گروه تلگرام
4. اتوماسیون Order Handoff (Issue #1 و #6)

### C) Intake اتومات محتوا
5. اضافه‌کردن ربات به @prefrontalclub با دسترسی لازم
6. Pipeline تبدیل پست کانال به Event (Issue #5)

### D) تجربه کاربر
7. Members Club UX v2 (premium)
8. حذف/آرشیو محصولات نمونه قدیمی (Issue #2)

## 4) موارد تکمیلی پیشنهادی برای کاهش ریسک
1. Runbook خطا (پرداخت موفق ولی دسترسی صادر نشده)
2. قالب پیام استاندارد ops برای سفارش
3. Idempotency برای webhook
4. KPI روزانه MVP:
   - تعداد پرداخت موفق
   - زمان تا Access Granted
   - نرخ خطای telegram_id
5. Launch checklist قبل از اولین فروش واقعی

## 5) Definition of Done — اولین فروش واقعی موفق
- پرداخت واقعی موفق
- اطلاعات کامل مشتری ثبت شده
- پیام سفارش به ops رسیده
- کاربر به کانال/گروه صحیح اضافه شده
- وضعیت سفارش + نوت کامل ثبت شده
- گزارش مورد در GitHub ثبت شده
