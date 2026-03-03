export default {
  async fetch(request, env) {
    const url = new URL(request.url);
    if (request.method !== 'POST') return new Response('Method Not Allowed', { status: 405 });

    const route = url.pathname;
    const body = await request.text();

    // TODO: verify HMAC per route
    // TODO: normalize payload
    // TODO: send Telegram ops notification

    return new Response(JSON.stringify({ ok: true, route }), {
      headers: { 'content-type': 'application/json' }
    });
  }
};
