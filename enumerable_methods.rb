module Enumerable

  def my_each
    i = 0
    while i < self.size
      yield(self[i])
      i += 1
    end
    self
  end

  def my_each_with_index
    i = 0
    while i < self.size
      yield(self[i], i)
      i += 1
    end
    self
  end

  def my_select
    results = []
    self.my_each do |e|
      results << e if yield(e)
    end
    results
  end

  def my_all?
    self.my_each do |e|
      return false if yield(e) == false || yield(e) == nil
    end
    return false if self.size == 0
    true
  end

  def my_any?
    self.my_each do |e|
      return true if yield(e) == true
    end
    false
  end

  def my_none?
    self.my_each do |e|
      return false if yield(e) == true
    end
    true
  end

  def my_count(arg = nil)
    count = []
    self.my_each do |e| 
      if block_given?
        count << e if yield(e)
      else
        count << e if e == arg
      end 
    end
    count.size
  end


end