import test from 'node:test';
import assert from 'node:assert/strict';
import fs from 'node:fs';
import path from 'node:path';
import { fileURLToPath } from 'node:url';

const root = path.resolve(path.dirname(fileURLToPath(import.meta.url)), '..');
test('the path-only release retains the domain adoption checkpoint and bilingual unit identity', () => {
  const en = fs.readFileSync(path.join(root, 'SoftwareEngineering/PHILOSOPHY.md'), 'utf8');
  const zh = fs.readFileSync(path.join(root, 'SoftwareEngineering/zh/PHILOSOPHY.md'), 'utf8');
  for (const text of [en,zh]) { assert.match(text, /^philosophy_version: 0\.2\.1$/m); assert.match(text, /^core_version: 0\.1\.2$/m); assert.match(text, /\]\(rationale\/README\.md\)/); }
  const ids = text => [...text.matchAll(/<!-- organon:id ([^ ]+) -->/g)].map(match => match[1]);
  assert.deepEqual(ids(en), ids(zh));
  assert(!fs.existsSync(path.join(root, 'SoftwareEngineering/docs/rationale.md')));
});
