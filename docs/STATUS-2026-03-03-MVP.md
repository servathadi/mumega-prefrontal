# وضعیت MVP — 2026-03-03

## خلاصه مدیریتی
- تست Stripe در محیط تست انجام شده و پرداخت با موفقیت عبور می‌کند.
- تمرکز MVP: فروش دوره‌ها + handoff سفارش به تلگرام + مدیریت دستی دسترسی تا قبل از اتوماسیون کامل.

## کارهای انجام‌شده
1. **زیرساخت GitHub و برنامه‌ریزی**
   - Roadmap و اسناد عملیاتی اضافه شد.
   - Issue backlog ساخته شد (#1 تا #7) برای اجرا/رفع باگ/اتوماسیون.
   - GitHub connectivity از سمت بات تست شد.

2. **Event/Course/Product Ops**
   - رویدادها و صفحات کلیدی ساخته/اصلاح شدند.
   - محصولات اولیه فروش ساخته شد:
     - دوره آفلاین میتولوژی (ID: 14684)
     - دوره آفلاین تحلیل رفتار متقابل (ID: 14687)
   - قیمت، virtual product و تصویر شاخص تنظیم شد.

3. **تجربه کاربری خرید و حساب**
   - صفحات WooCommerce از private به publish تغییر کرد:
     - `/cart/`, `/checkout/`, `/my-account/`
   - به منوی اصلی اضافه شد:
     - حساب کاربری، سبد خرید، باشگاه اعضا
   - صفحه اعضا ایجاد شد:
     - `https://prefrontalclub.com/members-club/`

4. **Checkout Data Readiness (Telegram handoff)**
   - فیلد اجباری `Telegram ID` به Checkout اضافه شد.
   - همان فیلد به My Account اضافه شد.
   - ذخیره در user meta و order meta فعال شد.
   - نمایش Telegram ID در پنل ادمین سفارش فعال شد.

5. **MCP Bug discovery & reporting**
   - باگ `wp_set_elementor` (truncate false-positive) شناسایی و ثبت شد:
     - Issue #7 + گزارش vendor-facing

## تصمیم‌های تاییدشده
- کانال فعلی ingestion: `@prefrontalclub`
- GitHub repo مرجع: `servathadi/mumega-prefrontal`
- مسیر MVP: WordPress + LearnPress/WooCommerce، دسترسی تلگرام فعلاً دستی
- اصل اجرایی: هر import → یک بهبود کوچک سایت + ثبت در GitHub

## لیست تسک‌های تیم برای MVP روان

### A) تیم محصول/محتوا
1. تایید لیست نهایی دوره‌های فعال قابل فروش (نام، قیمت، ارز)
2. برای هر دوره:
   - کاور اختصاصی
   - توضیح فروش کوتاه + بلند
   - CTA نهایی
3. تعیین وضعیت دوره‌ها:
   - Active / Archived

### B) تیم فروش/عملیات
4. تعیین SLA افزودن کاربر به گروه تلگرام بعد از پرداخت (پیشنهاد: <= 6 ساعت)
5. تعیین قالب استاندارد پیام داخلی سفارش برای `@PrefrontalClubAdmin`
6. تعیین مسیر escalation اگر Telegram ID اشتباه یا ناقص باشد

### C) تیم فنی
7. نهایی‌سازی webhook ووکامرس (`Order created` + در صورت نیاز `Order updated`)
8. تکمیل endpoint handoff (MVP بدون Cloudflare یا با Worker در فاز بعد)
9. اجرای idempotency + retry + logging برای اعلان تلگرام
10. افزودن validation سخت‌گیرانه برای `telegram_id` در checkout (فرمت @username)
11. بررسی و رفع bug MCP issue #7 با SitePilotAI

### D) تیم داده/مارکتینگ
12. تایید اتصال GA4/GSC برای رصد funnel خرید
13. تعریف KPI هفتگی:
   - تعداد سفارش موفق
   - زمان handoff تا access granted
   - نرخ خطای telegram_id

## کارهای فوری 48 ساعت آینده
1. پاکسازی/آرشیو محصولات نمونه غیرمرتبط از فروشگاه
2. تکمیل 2-4 محصول واقعی دیگر از لیست تیم
3. تست end-to-end واقعی:
   - پرداخت تست → سفارش → اعلان تلگرام → access granted note
4. ثبت گزارش تست در GitHub issue #1

## Definition of Done (MVP)
- کاربر بتواند خرید کند و اطلاعات کامل بدهد.
- تیم بتواند در کمتر از SLA کاربر را به تلگرام اضافه کند.
- وضعیت هر سفارش قابل ردیابی باشد.
- لاگ عملیاتی در GitHub کامل باشد.
