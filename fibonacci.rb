require 'minitest/autorun'

class TestFibonacci < Minitest::Test
  def test_recursive_base_case
    fibonacci = Fibonacci.new
    assert_equal(1, fibonacci.recursive(1))
  end

  def test_recursive
    fibonacci = Fibonacci.new
    assert_equal(21, fibonacci.recursive(8))
  end
end

class Fibonacci
  def recursive(n)
    return 0 if n == 0
    return 1 if n == 1

    return recursive(n - 2) + recursive(n - 1)
  end
end
