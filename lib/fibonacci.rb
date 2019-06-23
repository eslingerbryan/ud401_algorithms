require 'minitest/autorun'

class TestFibonacci < Minitest::Test
  FIB_500 = 139423224561697880139724382870407283950070256587697307264108962948325571622863290691557658876222521294125

  attr_reader :fibonacci

  def setup
    @fibonacci = Fibonacci.new
  end

  def test_recursive_base_case
    assert_equal(1, fibonacci.recursive(1))
  end

  def test_recursive
    assert_equal(21, fibonacci.recursive(8))
  end

  def test_dynamic_base
    assert_equal(1, fibonacci.dynamic(1))
  end

  def test_dynamic
    assert_equal(21, fibonacci.dynamic(8))
  end

  def test_dynamic_large_n
    assert_equal(FIB_500, fibonacci.dynamic(500))
  end
end

class Fibonacci
  def recursive(n)
    return 0 if n == 0
    return 1 if n == 1

    return recursive(n - 2) + recursive(n - 1)
  end

  def dynamic(n)
    fibonaccis = [0, 1]
    (2..n).each { |i| fibonaccis << fibonaccis[i - 2] + fibonaccis[i - 1] }

    fibonaccis[n]
  end
end
