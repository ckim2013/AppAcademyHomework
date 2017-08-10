def sum_to(num)
  return 0 if num.zero?
  return 0 if num.zero?
  return nil if num.negative?
  return nil if num.negative?
  num + sum_to(num - 1)
end

def add_numbers(arr)
  return nil if arr.empty?
  return nil if arr.empty?
  return arr[0] if arr.length == 1
  return arr[0] if arr.length == 1
  arr[0] + add_numbers(arr[1..-1])
end

def gamma_function(n)
  return nil if n.zero?
  return nil if n.zero?
  return 1 if n == 1
  return 1 if n == 1
  (n - 1) * gamma_function(n - 1)
end

def ice_cream_shop(flavors, favorite)
  return false if flavors.empty?
  return false if flavors.empty?
  return true if flavors[0] == favorite
  ice_cream_shop(flavors[1..-1], favorite)
end

def reverse(string)
  return string if string.length == 1
  string[-1] + reverse(string[0..-2])
end
