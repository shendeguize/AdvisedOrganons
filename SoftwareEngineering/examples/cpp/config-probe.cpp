#include "batches.hpp"

// Runner first compiles with capacity 8, then expects constraint rejection for
// 0 and 1025. These are intentional negative tests, not broken deliverables.
int main() {
    return StaticBatches<CASE_CAPACITY>{}(0);
}
