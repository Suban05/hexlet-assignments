# frozen_string_literal: true

require_relative 'test_helper'
require_relative '../lib/stack'

class StackTest < Minitest::Test
  # BEGIN
  def test_simple_pop
    stack = Stack.new([1, 2])
    assert { stack.size == 2 }
    assert { stack.pop! == 2 }
    assert { stack.size == 1 }
  end

  def test_should_pop_some_items
    stack = Stack.new([1, 2])
    assert { stack.size == 2 }
    assert { stack.pop! == 2 }
    stack.push!(3)
    assert { stack.pop! == 3 }
    assert { stack.pop! == 1 }
    assert { stack.empty? }
  end

  def test_should_push
    stack = Stack.new
    stack.push!(1)
    assert { stack.size == 1 }
  end

  def test_check_empty
    stack = Stack.new
    assert { stack.empty? }
  end

  def test_stack_should_be_not_empty
    stack = Stack.new([1])
    refute { stack.empty? }
  end

  def test_converts_to_array
    elements = [1, 3, 4]
    stack = Stack.new(elements)
    assert { elements == stack.to_a }
  end

  def test_stack_should_be_empty_after_clear
    stack = Stack.new([1])
    refute { stack.empty? }
    stack.clear!
    assert { stack.empty? }
  end

  def test_checks_size
    elements = [1, 3, 4]
    stack = Stack.new(elements)
    assert { elements.size == stack.size }
  end
  # END
end

test_methods = StackTest.new({}).methods.select { |method| method.start_with? 'test_' }
raise 'StackTest has not tests!' if test_methods.empty?
