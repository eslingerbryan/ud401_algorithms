require 'minitest/autorun'

class TestLongestIncreasingSubsequence < Minitest::Test
  SEQUENCE = [5, 7, 4, -3, 9, 1, 10, 4, 5, 8, 9, 3]
  LONGEST_INCREASING_SUBSEQUENCE = [-3, 1, 4, 5, 8, 9]

  def test_length_non_empty
    l_i_s = LongestIncreasingSubsequence.new(SEQUENCE)
    assert_equal(LONGEST_INCREASING_SUBSEQUENCE.size, l_i_s.length)
  end

  def test_length_empty
    l_i_s = LongestIncreasingSubsequence.new([])
    assert_equal(0, l_i_s.length)
  end

  def test_length_n_equal_1
    l_i_s = LongestIncreasingSubsequence.new([42])
    assert_equal(1, l_i_s.length)
  end
end

class LongestIncreasingSubsequence
  attr_reader :max_lengths_ending_at, :sequence

  def initialize(sequence)
    @sequence = sequence
    @max_lengths_ending_at = []
  end

  def length
    # Approach:
    # 1. define the length function
    # let n = size(s) - 1 (index of last element)
    # let L(i) = length of LIS on [s_1, s_2, ..., s_i] that includes s_i
    # 2. define the recurrence relation
    # L(i) in terms of L(1), ..., L(i-1):
    # L(i) = max_j { L(j): j < i & s_j < s_i } + 1
    # Or: L(i) = 1 + max of L(j) over (0 <= j <= i-1) such that s_j < s_i
    # solution:
    # max_i (L(i): 0 <= i <= n)
    return 0 if sequence.empty?

    sequence.size.times { |i| max_lengths_ending_at << 1 + max_length_before(i - 1) }
    max_lengths_ending_at.max
  end

  def max_length_before(k)
    (0..k)
    .select { |j| sequence[j] < sequence[k] }
    .map { |j| max_lengths_ending_at[j] }
    .max || 0
  end
end
