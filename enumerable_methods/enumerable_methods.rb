module Enumerable
    def my_each
      self.length.times{|i| yield self[i]} 
      self
    end
  
    def my_each_with_index
      self.length.times{|i| yield(self[i],i)} 
      self
      self
    end
  
    def my_select
      result = []
      self.my_each{|i| result << i if yield(i) == true}
      result
    end
  
    def my_all?
      self.my_each{|i| return false unless yield(i)}
      true
    end
  
    def my_any?
      self.my_each{|i| return true if yield(i)}
      false
    end
  
    def my_none?
      self.my_each{|i| return false if yield(i)}
      true
    end
    
    def my_count(item = nil)
      count = 0
      if !item
        count = self.length
      else
        self.my_each{|i| count +=1 if (i == item)}
      end
      self.my_each{|i| count += 1 if yield(i)} if block_given?
      count
    end
  
    def my_map(proc = nil)
      result = []
      (proc)?
      self.my_each{|i| result << proc.call(i)} : 
      self.my_each{|i| result << yield(i)}
      result
    end
  
    def my_inject(total = 0)
      self.my_each{|i| total = yield(total, i)}
      total 
    end
    
  end
  
  def multiply_els(array, accu)
    array.my_inject(accu){|running_total, current| running_total * current}
  end