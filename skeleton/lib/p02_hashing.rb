class Integer
  # Integer#hash already implemented for you
end

class Array
  def hash
    return 1 if self.length == 0
    count = 0
    self.each.with_index do |ele,i|
      count += ele.hash * i
    end
    count
  end
end

class String
  def hash
    return 1 if self.length == 0
    count = 0
    self.split("").each.with_index do |char,i|
      count += char.hash * i
    end
    count
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    0
  end
end
