# frozen_string_literal: true

# rubocop: disable Lint/Void

# rubocop: disable Lint/RedundantWithIndex

# rubocop: disable Style/EvenOdd

require_relative '../lib/enumerables.rb'

array1_test = [1, 2, 3, 4, 5]
testproc_test = proc { |x| x * x }
array_f_test = [1, 3.14, 42]
array_e_test = []
array_s_test = %w[ant bear cat]
array3_test = [1, 2i, 3.14]
array4_test = [nil, true, 99]

RSpec.describe Enumerable do
  describe '#my_each' do
    it 'should return an enumerable if the block was not passed' do
      expect(array1_test.my_each).to be_a(Enumerable)
    end
    it 'should return the array' do
      expect(array1_test.my_each { |x| x }).to eql(array1_test.each { |x| x })
    end
    it 'should the block' do
      output1 = []
      output2 = []
      array1_test.my_each { |x| output1 << x + 1 }
      array1_test.each { |x| output2 << x + 1 }
      expect(output1).to eql(output2)
    end
  end

  describe '#my_each_with_index' do
    it 'should return an enumerable if the block was not passed' do
      expect(array1_test.my_each_with_index).to be_a(Enumerable)
    end
    it 'should return the array' do
      expect(array1_test.my_each_with_index { |x| x }).to eql(array1_test.each_with_index { |x| x })
    end
    it 'should do the block' do
      output1 = []
      output2 = []
      array1_test.my_each_with_index { |x| output1 << x + 1 }
      array1_test.each_with_index { |x| output2 << x + 1 }
      expect(output1).to eql(output2)
    end
  end

  describe '#my_select' do
    it 'should return an enumerable if the block was not passed' do
      expect(array1_test.my_select).to be_a(Enumerable)
    end
    it 'should return a selected array' do
      expect(array1_test.my_select { |x| x > 2 }).to eql(array1_test.select { |x| x > 2 })
    end
  end

  describe '#my_all' do
    it 'the block should returns true' do
      expect(array_s_test.my_all? { |x| x.length >= 3 }).to eql(array_s_test.all? { |x| x.length >= 3 })
    end
    it 'the block should returns false' do
      expect(array_s_test.my_all? { |x| x.length >= 4 }).to eql(array_s_test.all? { |x| x.length >= 4 })
    end
    it 'should returns true' do
      expect(array3_test.my_all?(Numeric)).to eql(array3_test.all?(Numeric))
      expect(array_e_test.my_all?).to eql(array_e_test.all?)
    end
    it 'should returns false' do
      expect(array_s_test.my_all?(/t/)).to eql(array_s_test.all?(/t/))
      expect(array4_test.my_all?).to eql(array4_test.all?)
    end
  end

  describe '#my_all' do
    it 'the block should returns true' do
      expect(array_s_test.my_all? { |x| x.length >= 3 }).to eql(array_s_test.all? { |x| x.length >= 3 })
    end
    it 'the block should returns false' do
      expect(array_s_test.my_all? { |x| x.length >= 4 }).to eql(array_s_test.all? { |x| x.length >= 4 })
    end
    it 'should returns true' do
      expect(array3_test.my_all?(Numeric)).to eql(array3_test.all?(Numeric))
      expect(array_e_test.my_all?).to eql(array_e_test.all?)
    end
    it 'should returns false' do
      expect(array_s_test.my_all?(/t/)).to eql(array_s_test.all?(/t/))
      expect(array4_test.my_all?).to eql(array4_test.all?)
    end
  end

  describe '#my_all' do
    it 'the block should returns true' do
      expect(array_s_test.my_all? { |x| x.length >= 3 }).to eql(array_s_test.all? { |x| x.length >= 3 })
    end
    it 'the block should returns false' do
      expect(array_s_test.my_all? { |x| x.length >= 4 }).to eql(array_s_test.all? { |x| x.length >= 4 })
    end
    it 'should returns true' do
      expect(array3_test.my_all?(Numeric)).to eql(array3_test.all?(Numeric))
      expect(array_e_test.my_all?).to eql(array_e_test.all?)
    end
    it 'should returns false' do
      expect(array_s_test.my_all?(/t/)).to eql(array_s_test.all?(/t/))
      expect(array4_test.my_all?).to eql(array4_test.all?)
    end
  end

  describe '#my_all' do
    it 'the block should returns true' do
      expect(array_s_test.my_all? { |x| x.length >= 3 }).to eql(array_s_test.all? { |x| x.length >= 3 })
    end
    it 'the block should returns false' do
      expect(array_s_test.my_all? { |x| x.length >= 4 }).to eql(array_s_test.all? { |x| x.length >= 4 })
    end
    it 'should returns true' do
      expect(array3_test.my_all?(Numeric)).to eql(array3_test.all?(Numeric))
      expect(array_e_test.my_all?).to eql(array_e_test.all?)
    end
    it 'should returns false' do
      expect(array_s_test.my_all?(/t/)).to eql(array_s_test.all?(/t/))
      expect(array4_test.my_all?).to eql(array4_test.all?)
    end
  end

  describe '#my_any' do
    it 'the block should returns true' do
      expect(array_s_test.my_any? { |x| x.length >= 3 }).to eql(array_s_test.any? { |x| x.length >= 3 })
      expect(array_s_test.my_any? { |x| x.length >= 4 }).to eql(array_s_test.any? { |x| x.length >= 4 })
    end
    it 'should returns true' do
      expect(array3_test.my_any?(Numeric)).to eql(array3_test.any?(Integer))
      expect(array3_test.my_any?).to eql(array3_test.any?)
    end
    it 'should returns false' do
      expect(array_s_test.my_any?(/d/)).to eql(array_s_test.any?(/d/))
      expect(array_e_test.my_any?).to eql(array_e_test.any?)
    end
  end

  describe '#my_none' do
    it 'the block should returns true' do
      expect(array_s_test.my_none? { |x| x.length == 5 }).to eql(array_s_test.none? { |x| x.length == 5 })
    end
    it 'the block should returns false' do
      expect(array_s_test.my_none? { |x| x.length >= 4 }).to eql(array_s_test.none? { |x| x.length >= 4 })
    end
    it 'should returns true' do
      expect(array_s_test.my_none?(/d/)).to eql(array_s_test.none?(/d/))
      expect(array_e_test.my_none?).to eql(array_e_test.none?)
    end
    it 'should returns false' do
      expect(array_f_test.my_none?(Float)).to eql(array_f_test.none?(Float))
    end
  end

  describe '#my_count' do
    it 'should return the length if the block was not passed' do
      expect(array1_test.my_count).to eql(array1_test.count)
    end
    it 'should return the count on block' do
      expect(array1_test.my_count(2)).to eql(array1_test.count(2))
      expect(array1_test.my_count { |x| x % 2 == 0 }).to eql(array1_test.count { |x| x % 2 == 0 })
    end
  end

  describe '#my_map' do
    it 'should return an enumerable if the block was not passed' do
      expect(array1_test.my_map).to be_a(Enumerable)
    end
    it 'should return the map on block' do
      expect(array1_test.my_map { |x| x * x }).to eql(array1_test.map { |x| x * x })
      expect(array1_test.my_map(&testproc_test)).to eql(array1_test.map(&testproc_test))
    end
  end

  describe '#my_inject' do
    it 'my_inject sum error' do
      expect((5..10).my_inject { |sum, n| sum + n }).to eql((5..10).inject { |sum, n| sum + n })
    end
    it 'my_inject product error' do
      expect((5..10).inject(1) { |product, n| product * n }).to eql((5..10).inject(1) { |product, n| product * n })
    end

    it 'my_inject logic' do
      longest1 = array_s_test.my_inject do |x, y|
        x.length > y.length ? x : y
      end
      longest2 = array_s_test.inject do |x, y|
        x.length > y.length ? x : y
      end
      expect(longest1).to eql(longest2)
    end
  end
end

# rubocop: enable Lint/Void

# rubocop: enable Lint/RedundantWithIndex

# rubocop: enable Style/EvenOdd
