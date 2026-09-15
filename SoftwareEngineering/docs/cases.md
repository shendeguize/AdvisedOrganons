# Constructed software engineering cases

These original, isolated examples compare concrete implementation choices under
declared requirements. They are not observations of a production repository, an
independent assessment of the philosophy, or evidence that a philosophy
is correct. Each example explicitly identifies its contract and known
counterexample. They do not use the formal independent case set or held-out material.
The separate [AgentOrganon architecture case](../rationale/architecture-case.md) examines
actual repository responsibilities with its own sources and limits.

The examples need Node.js and a C++20 compiler, with no third-party packages.
The combined runner defaults to `/usr/bin/clang++`; `CXX` can select another
compiler whose constraint diagnostics contain `constraints not satisfied`.
Run from the directory containing `examples/` and `docs/`:

```sh
rtk proxy node examples/run.mjs
```

The runner records the exact argument vectors, tool versions, stdout, stderr,
exit status, and termination signals in
`examples/.local/verification.log`. Generated binaries and logs stay under
`examples/.local/`, covered by `examples/.gitignore`. A run replaces that log;
preserve it separately before rerunning if comparison between runs is needed.
An unexpected command result makes the runner fail. Intentional compile
rejections count as success only when the compiler exits nonzero and reports an
unsatisfied constraint. A valid instantiation of the same probe must compile
and run first.

## 1. JavaScript: observable contracts across a refactor

**Objective and constraints.** A caller needs duplicate strings removed while
preserving first occurrence order. The accepted domain is ordinary dense arrays
of strings, including frozen arrays; equality is exact, with no case folding or
Unicode normalization. The result is a fresh caller-owned array, and the input
is unchanged. Invalid input throws `TypeError`, without a specified message.
Proxies, accessors, hostile modifications of built-ins, and resource exhaustion
are outside this example.

**Variants.** `stableUniqueLoop` uses iteration and a local `Set`;
`stableUniqueReduce` uses reduction and array operations. They expose the same
declared behavior. `sortedUnique` deliberately preserves the surface shape
`string[] -> string[]` while sorting the output. Its known counterexample is
`['b', 'a', 'b']`: the required result is `['b', 'a']`, and the bad replacement
returns `['a', 'b']`.

**Checks and observations.** The shared suite checks empty inputs, duplicates,
ordering, exact string distinctions, frozen inputs, result ownership, and invalid
inputs including a sparse array. Both correct implementations pass. A separate
negative test confirms that the bad result meets the surface shape and that the
same equality assertion rejects it. This expected rejection is caught by the
test: a green suite means the counterexample was detected, not that the bad
replacement satisfies the contract.

The maintained source is [stable-unique.mjs](../examples/js/stable-unique.mjs);
the predeclared examples and checks are in
[contract.test.mjs](../examples/js/contract.test.mjs). Rerun this case alone from
the directory containing `examples/`:

```sh
rtk proxy node --test examples/js/contract.test.mjs
```

**Limits and maintenance decision.** Passing these finite examples supports a
bounded refactoring claim; it does not prove equivalence for every JavaScript
interaction. Input validation is deliberately shared, so common defects could
escape a comparison of the two implementations. Expected results and rejection
checks provide additional, still incomplete evidence.

The reduction variant repeatedly searches and copies its growing accumulator;
that source-level observation warrants checking relevant workload costs before
choosing it. No latency, memory, or throughput advantage was measured. Where
such costs threaten a specific service objective, behavior agreement alone is
insufficient reason to adopt it. A human or agent maintainer can retain the loop,
revert a proposed replacement, or remove a redundant variant after choosing an
implementation. Keeping both forever is not an acceptance condition. Retain the
observable contract and its regression checks across that decision.

## 2. C++20: static configuration, generic shape, and runtime change

**Objective and constraints.** A batch counter accepts record counts in
`[0, 1,000,000]` and capacities in `[1, 1024]`, returning the ceiling of count
divided by capacity. A partial final batch counts as one. Invalid runtime
arguments throw `std::invalid_argument`; message text is unspecified. A separate
requirement asks for capacity to change within the same process, without
recompilation. These are explicitly different requirements: fixed deployment
configuration and live changes should not be silently treated as interchangeable.

**Variants.** `StaticBatches<Capacity>` constrains configuration using a C++20
`requires` clause. `RuntimeBatches` validates capacity at construction and on
updates. Both validate record counts at runtime. The `BatchPolicy` concept
requires a const-callable expression returning `int`; `count_batches` accepts
either policy through that generic interface. `DropsPartialBatch` satisfies the
concept but deliberately truncates `9 / 8` to `1`, violating the required `2`.

**Checks and observations.** The executable checks empty, exact, partial, and
domain-boundary counts; valid static capacity boundaries; invalid counts for
both variants; invalid runtime configurations; and update behavior. Changing
runtime capacity from `8` to `4` changes the result for `9` records from `2` to
`3`. Rejected updates preserve the preceding valid capacity. The static
specialization remains at `2`. The concept accepts the deliberately bad policy,
and an explicit semantic check observes its known violation.

The runner also compiles the same configuration probe with capacity `8`, then
checks compiler rejection for `0` and `1025`. Compile rejection here establishes
that these invalid static configurations are excluded. It does not establish
the semantic contract for every accepted policy: the counterexample compiles.
The checks and implementation are in [case.cpp](../examples/cpp/case.cpp),
[batches.hpp](../examples/cpp/batches.hpp), and
[config-probe.cpp](../examples/cpp/config-probe.cpp). Use the combined runner
above to reproduce both positive execution and expected negative compilation.

**Limits and maintenance decision.** A `requires` expression and a successful
compilation check a specified set of language constraints. They do not prove
semantic substitutability or eliminate validation of dynamic inputs. A fixed
specialization alone cannot satisfy the live-change requirement. Selecting among
compiled specializations would add runtime selection and a supported set of
configurations; it does not supply live changes at no cost. This case measures
neither optimization benefits nor dispatch costs and ranks no paradigm by name.

For a deployment whose capacity really is fixed, either implementation remains
a candidate under its actual objectives. For the live-change requirement, the
runtime variant meets the demonstrated change behavior. A migration from runtime
configuration to a fixed specialization should stop or be withdrawn if live
changes remain required and no acceptable replacement is established. Removing
the runtime path is defensible only after its concrete obligations have been
retired or transferred. That is an illustrative decision boundary, not a report
of a completed production migration or an authorization to perform one.

## Local execution record and scope of support

On 2026-09-12, the combined runner completed all 9 commands: tool version reads,
5 passing JavaScript tests, C++ compilation and execution, compilation and
execution of the valid configuration probe, and 2 expected static constraint
rejections. The raw versions and diagnostic output are retained in
`examples/.local/verification.log`.

The cases show specific consequences of declared requirements and implementation
choices. They do not establish universal superiority of functional, imperative,
generic, compile-time, or runtime techniques. They also do not demonstrate
production scalability, migration safety, or the quality of any philosophical
adoption process. The contract, examples, expected counterexamples, and rerun
commands give future human and agent maintainers an inspectable starting point
for revising or removing these examples when their stated purpose changes.
