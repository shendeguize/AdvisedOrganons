function validate(items) {
  if (!Array.isArray(items)) throw new TypeError('expected an array of strings');
  for (const item of items) {
    if (typeof item !== 'string') throw new TypeError('expected a string');
  }
}

// Both implementations keep their state local; callers own the returned array.
export function stableUniqueLoop(items) {
  validate(items);
  const seen = new Set();
  const result = [];
  for (const item of items) {
    if (!seen.has(item)) {
      seen.add(item);
      result.push(item);
    }
  }
  return result;
}

export function stableUniqueReduce(items) {
  validate(items);
  return items.reduce((result, item) =>
    result.includes(item) ? result : [...result, item], []);
}

// Deliberately wrong replacement: string[] -> string[] does not encode order.
export function sortedUnique(items) {
  return stableUniqueLoop(items).sort();
}
