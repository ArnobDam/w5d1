class MaxIntSet

  attr_reader :store  

  def initialize(max)
    @max = max
    @store = Array.new(@max,false)
  end

  def insert(num)
    raise 'Out of bounds' if num > @max || num < 0
    store[num] = true
  end

  def remove(num)
    store[num] = false
  end

  def include?(num)
    store[num] 
  end

  private

  def is_valid?(num)
  end

  def validate!(num)
  end
end


class IntSet
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
      @store[num % @store.length] << num
  end

  def remove(num)
    if @store[num % @store.length].include?(num)
      @store[num % @store.length].delete(num)
    end
  end

  def include?(num)
    if @store.flatten.include?(num)
      return true
    else
      false
    end
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    if !@store[num % @store.length].include?(num)
      @store[num % @store.length] << num
      count
    end
    if @count >= num_buckets
      resize!
    end
  end

  def remove(num)
    if @store[num % @store.length].include?(num)
      @store[num % @store.length].delete(num)
    else
      return
    end
  end

  def include?(num)
    if @store.flatten.include?(num)
      return true
    else
      false
    end
  end

  def count
    @count = 0
    @store.each do |buck|
      @count += buck.length
    end
    @count
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end

  def resize!
      store2 = Array.new(num_buckets * 2) { Array.new }
      @store.each do |buck|
        buck.each do |num|
          store2[num % (num_buckets * 2)] << num
        end
      end
       @store = store2
  end




end
