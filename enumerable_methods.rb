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
    self.my_each { |e| results << e if yield(e) }
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
    self.my_each { |e| return false if yield(e) == true }
    true
  end

  def my_count(arg = nil)
    count = 0
    self.my_each do |e| 
      if block_given?
        count += 1 if yield(e)
      else
        count += 1 if e == arg
      end 
    end
    count
  end

  def my_map(&proc)
    mapped_array = []
    self.my_each { |e| mapped_array << yield(e) }
    mapped_array
  end

  def my_inject(arg = nil)
    total = arg if arg != nil
    if arg == nil
      total = self[0]
      i = 1
      while i < self.size
        total = yield(total, self[i])
        i += 1
      end
    else
      self.my_each { |e| total = yield(total, e) }
    end
    total
  end

end