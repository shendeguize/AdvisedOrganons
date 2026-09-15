#include "batches.hpp"
#include <iostream>
#include <stdexcept>

void check(bool condition, const char* message) {
    if (!condition) throw std::runtime_error(message);
}

template<class Operation>
void rejects(Operation operation) {
    try { operation(); }
    catch (const std::invalid_argument&) { return; }
    throw std::runtime_error("expected invalid_argument");
}

int main() {
    StaticBatches<8> fixed;
    RuntimeBatches changing(8);
    check(count_batches(fixed, 0) == 0, "empty batch count");
    check(count_batches(fixed, 8) == 1, "exact batch count");
    check(count_batches(fixed, 9) == 2, "partial final batch counts");
    check(count_batches(changing, 9) == 2, "initial runtime capacity");
    check(count_batches(StaticBatches<1>{}, 1'000'000) == 1'000'000,
          "capacity and record-count boundary");
    check(count_batches(StaticBatches<1024>{}, 1025) == 2, "upper capacity boundary");
    rejects([&] { count_batches(fixed, -1); });
    rejects([&] { count_batches(fixed, 1'000'001); });
    rejects([&] { count_batches(changing, -1); });
    rejects([&] { count_batches(changing, 1'000'001); });
    rejects([] { RuntimeBatches invalid(0); });
    rejects([] { RuntimeBatches invalid(1025); });
    changing.set_capacity(4); // A requirement to vary without recompilation.
    check(count_batches(changing, 9) == 3, "runtime capacity change");
    rejects([&] { changing.set_capacity(0); });
    rejects([&] { changing.set_capacity(1025); });
    check(count_batches(changing, 9) == 3, "invalid update preserves old capacity");
    check(count_batches(fixed, 9) == 2, "static specialization remains fixed");
    static_assert(BatchPolicy<DropsPartialBatch>);
    check(count_batches(DropsPartialBatch{}, 9) == 1, "known bad policy observed");
    check(count_batches(DropsPartialBatch{}, 9) != 2, "known semantic violation exposed");
    std::cout << "PASS: static and runtime boundaries; runtime update; "
                 "concept-compatible semantic counterexample (9 / 8: 1, required 2)\n";
}
