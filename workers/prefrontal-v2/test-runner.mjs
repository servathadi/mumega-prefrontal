import worker from './index.js';
import fs from 'fs';

const payloads = JSON.parse(fs.readFileSync(new URL('./test-payloads.json', import.meta.url)));

async function run(route, bodyObj) {
  const req = new Request(`https://example.com${route}`, {
    method: 'POST',
    headers: { 'content-type': 'application/json' },
    body: JSON.stringify(bodyObj),
  });
  const res = await worker.fetch(req, {});
  const text = await res.text();
  console.log(route, res.status, text);
}

await run('/webhook/woo-order', payloads.woo_order);
await run('/webhook/brochure-download', payloads.brochure_download);
