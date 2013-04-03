
def add(a,b)
  a+b
end

def sum(list_of_numbers)
  total = 0;
  list_of_numbers.each do |entry|
    total = total + entry;
  end
  total
end

def subtract(a,b)
  a-b
end

def multiply(*numbers)
  if numbers[0].class == Array
    return numbers[0].inject{|sum,x|sum*x}
  end
  numbers[0]*numbers[1]
end

def power(a,b)
  return a if b <= 1
  return a * power(a,b-1)
end

def factorial(n)
  return 1 unless n > 1
  return n * factorial(n-1)
end