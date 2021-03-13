def input()
    puts "Введите #{ARGV[0]} элементов:"
    arr = []
    for _ in 0...(ARGV[0].to_i)
        arr << STDIN.gets.chomp.to_i
    end
    return arr
end


def add1(arr, elem)
    arr << elem
end


def add2(arr, elem)
    arr.unshift(elem)
end


def add3(arr, elem)
    arr.push(elem)
end


def add4(arr, elem)
    arr[arr.size] = elem
end


def add5(arr, elem)
    arr.concat([elem])
end


def add6(arr, elem)
    arr.insert(arr.size, elem)
end


arr = [1, 2, 3, 4, 5]

add1(arr, 6)
add2(arr, 0)
add3(arr, 7)
add4(arr, 8)
add5(arr, 9)
add6(arr, 10)
print arr  # -> [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10]