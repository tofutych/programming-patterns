puts "Введите элементы массива через пробел"
arr = gets.chomp.split.map(&:to_i)


def max(arr)
    return arr.max
end

def min(arr)
    return arr.min
end

def sum(arr)
    return arr.sum
end

def product(arr)
    return arr.inject(:*)
end

