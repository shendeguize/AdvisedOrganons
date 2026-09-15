#pragma once
#include <concepts>
#include <stdexcept>

// Observable contract: counts in [0, 1,000,000], capacity in [1, 1024];
// return ceiling(count / capacity), counting a partial final batch.
// Invalid runtime arguments throw invalid_argument; no message contract.
inline void validate_count(int count) {
    if (count < 0 || count > 1'000'000)
        throw std::invalid_argument("record count outside declared domain");
}

inline int ceiling_batches(int count, int capacity) {
    return count / capacity + (count % capacity != 0);
}

template<int Capacity>
requires (Capacity >= 1 && Capacity <= 1024)
struct StaticBatches {
    int operator()(int count) const {
        validate_count(count);
        return ceiling_batches(count, Capacity);
    }
};

class RuntimeBatches {
    int capacity_;
public:
    explicit RuntimeBatches(int capacity) { set_capacity(capacity); }
    void set_capacity(int capacity) {
        if (capacity < 1 || capacity > 1024)
            throw std::invalid_argument("capacity outside declared domain");
        capacity_ = capacity;
    }
    int operator()(int count) const {
        validate_count(count);
        return ceiling_batches(count, capacity_);
    }
};

// This concept checks an expression and return type, not the semantic contract.
template<class Policy>
concept BatchPolicy = requires(const Policy& policy, int count) {
    { policy(count) } -> std::same_as<int>;
};

template<BatchPolicy Policy>
int count_batches(const Policy& policy, int count) { return policy(count); }

struct DropsPartialBatch {
    int operator()(int count) const {
        validate_count(count);
        return count / 8; // Deliberate, documented counterexample.
    }
};
