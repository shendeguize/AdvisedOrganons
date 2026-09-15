import { spawnSync } from 'node:child_process';
import { mkdirSync, writeFileSync } from 'node:fs';
import { fileURLToPath } from 'node:url';
import { join } from 'node:path';

const root = fileURLToPath(new URL('.', import.meta.url));
const output = join(root, '.local');
mkdirSync(output, { recursive: true });
const log = [];
let checks = 0;
const compiler = process.env.CXX || '/usr/bin/clang++';
function run(command, args, expectedFailure = false) {
  const result = spawnSync(command, args, { cwd: root, encoding: 'utf8' });
  log.push(`$ ${[command, ...args].map(x => JSON.stringify(x)).join(' ')}`,
    result.stdout || '', result.stderr || '',
    `exit=${result.status}; signal=${result.signal}; error=${result.error?.message || 'none'}`);
  writeFileSync(join(output, 'verification.log'), log.join('\n') + '\n');
  if (result.error || result.signal || result.status === null ||
      (expectedFailure ? result.status === 0 : result.status !== 0)) {
    throw new Error(`unexpected result; inspect ${join(output, 'verification.log')}`);
  }
  if (expectedFailure && !/constraints not satisfied/.test(result.stderr)) {
    throw new Error('negative compile failed for an unexpected reason; inspect verification.log');
  }
  checks++;
}

run(process.execPath, ['--version']);
run(compiler, ['--version']);
run(process.execPath, ['--test', 'js/contract.test.mjs']);
const flags = ['-std=c++20', '-Wall', '-Wextra', '-Werror', '-pedantic'];
run(compiler, [...flags, 'cpp/case.cpp', '-o', join(output, 'cpp-case')]);
run(join(output, 'cpp-case'), []);
run(compiler, [...flags, '-DCASE_CAPACITY=8', 'cpp/config-probe.cpp', '-o', join(output, 'config-probe')]);
run(join(output, 'config-probe'), []);
for (const capacity of [0, 1025]) {
  run(compiler, [...flags, `-DCASE_CAPACITY=${capacity}`, '-fsyntax-only', 'cpp/config-probe.cpp'], true);
}
console.log(`PASS: ${checks} commands, including 2 expected constraint rejections. Raw output: ${join(output, 'verification.log')}`);
