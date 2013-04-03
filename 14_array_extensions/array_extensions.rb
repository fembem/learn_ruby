class Array

  def sum
    reduce(0) do |sum, value|
        sum + value
    end
  end

  def square
    map{|x| x*x}
  end

  def square!
    each_index{|i| x = self[i]; self[i]=x*x}
  end

end