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
    results = []
    self.my_each do |e|
      results << e if yield(e) 
    end
    return false if self.size == 0
    results.size == self.size ? true : false
  end

  def my_any?
    results = []
    self.my_each do |e|
      results << e if yield(e)
    end
    results.size > 0 ? true : false
  end

  def my_none?
    results = []
    self.my_each do |e|
      results << e if yield(e)
    end
    results.size == 0 ? true : false
  end
end