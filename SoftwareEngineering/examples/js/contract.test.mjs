import assert from 'node:assert/strict';
import test from 'node:test';
import { stableUniqueLoop, stableUniqueReduce, sortedUnique } from './stable-unique.mjs';

// Declared observable contract: ordinary dense arrays of strings (including
// frozen arrays), exact string equality, first occurrence order, a fresh array,
// no input mutation. Invalid arrays/elements throw TypeError; message unspecified.
// Proxies, accessors and hostile built-in modification are outside this case.
const cases = [
  [[], []],
  [['b', 'a', 'b'], ['b', 'a']], // Known counterexample to sorting, fixed in advance.
  [['', 'A', 'a', ''], ['', 'A', 'a']],
  [['é', 'e\u0301', 'é'], ['é', 'e\u0301']],
];

for (const implementation of [stableUniqueLoop, stableUniqueReduce]) {
  test(`${implementation.name}: declared examples and input ownership`, () => {
    for (const [source, expected] of cases) {
      const input = Object.freeze([...source]);
      const actual = implementation(input);
      assert.deepEqual(actual, expected);
      assert.notEqual(actual, input);
      assert.deepEqual(input, source);
      actual.push('caller-owned');
      assert.deepEqual(input, source);
    }
  });
  test(`${implementation.name}: rejects invalid input`, () => {
    for (const input of [null, 'a', {}, ['a', 1], new Array(1)]) {
      assert.throws(() => implementation(input), TypeError);
    }
  });
}

test('known bad replacement has the surface shape but violates order', () => {
  const input = Object.freeze(['b', 'a', 'b']);
  const actual = sortedUnique(input);
  assert.ok(Array.isArray(actual) && actual.every(x => typeof x === 'string'));
  assert.deepEqual(actual, ['a', 'b']);
  assert.throws(() => assert.deepEqual(actual, ['b', 'a']), assert.AssertionError);
});
