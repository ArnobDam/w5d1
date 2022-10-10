require_relative "p02_hashing"

class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    if !@store[key.hash % @store.length].include?(key)
      @store[key.hash % @store.length] << key
      count
    end
    if @count > num_buckets
      resize!
    end
  end

  def include?(key)
    if @store.flatten.include?(key)
      return true
    else
      false
    end
  end

  def remove(key)
    if @store[key.hash % @store.length].include?(key)
      @store[key.hash % @store.length].delete(key)
    else
      return
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
        store2[num.hash % (num_buckets * 2)] << num
      end
    end
     @store = store2
  end
end

p [].hash