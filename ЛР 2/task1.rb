def input()
    arr = []

    puts "Ввод элементов закончите пустой строкой"
    elem = gets.chomp.to_i

    while elem != 0
        arr << elem 
        elem = gets.chomp.to_i
    end

    return arr
end


def min(arr)
    m = arr[0]

    for i in 0...(arr.size)
        if m > arr[i]
            m = arr[i]
        end
    end

    return m
end


def max(arr)
    m = arr[0]

    for i in 0...(arr.size)
        if arr[i] > m
            m = arr[i]
        end
    end

    return m
end


def sum(arr)
    s = 0

    for i in 0...(arr.size)
        s += arr[i]
    end

    return s
end


def product(arr)
    pr = 1

    for i in 0...(arr.size)
        pr *= arr[i]
    end

    return pr
end


arr = input()
puts sum(arr)
puts product(arr)