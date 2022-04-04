module Enumerable
  # Your code goes here
  
  def my_each_with_index
    index = 0
    for element in self do
      yield element, index
      index += 1
    end
  end

  def my_select
    result = []
    my_each{|element| result.push(element) if yield element}
    result
  end

  def my_all?
    my_each{|element| return false unless yield element}
    true
  end

  def my_any?
    my_each{|element| return true if yield element}
    false
  end

  def my_none?
    my_each{|element| return false if yield element}
    true
  end

  def my_count
    return length if !block_given?
    count=0
    my_each{|element| count+=1 if yield element }
    count
  end

end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each
    for element in self do
      yield element
    end
  end
end
