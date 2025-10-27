#!/usr/bin/env node
const fs = require('fs');
const path = require('path');
const puppeteer = require('puppeteer');

async function run() {
  const [url, outPath, widthArg, heightArg, selector] = process.argv.slice(2);
  if (!url || !outPath) {
    console.error('Usage: node scripts/screenshot.js <url> <outPath> [width] [height] [selector]');
    process.exit(1);
  }
  const width = parseInt(widthArg || '600', 10);
  const height = parseInt(heightArg || '400', 10);

  const outDir = path.dirname(outPath);
  if (!fs.existsSync(outDir)) {
    fs.mkdirSync(outDir, { recursive: true });
  }

  const browser = await puppeteer.launch({ headless: 'new' });
  try {
    const page = await browser.newPage();
    await page.setViewport({ width, height });
    await page.goto(url, { waitUntil: 'networkidle2', timeout: 60000 });

    if (selector) {
      await page.waitForSelector(selector, { timeout: 10000 });
      const el = await page.$(selector);
      if (!el) throw new Error(`Selector not found: ${selector}`);
      await el.screenshot({ path: outPath });
    } else {
      await page.screenshot({ path: outPath });
    }

    console.log(`Saved screenshot: ${outPath}`);
  } catch (err) {
    console.error('Screenshot failed:', err.message);
    process.exit(1);
  } finally {
    await browser.close();
  }
}

run();