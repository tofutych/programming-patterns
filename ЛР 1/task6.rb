def sum(num)
    acc = 0

    num.each_char do |char|
        acc += char.to_i
    end

    acc
end


def product(num)
    acc = 1

    num.each_char do |char|
        acc *= char.to_i
    end

    acc
end


def min_digit(num)
    min = num[0].to_i

    num.each_char do |char|
        if min > char.to_i
            min = char.to_i
        end
    end

    min
end


def max_digit(num)
    max = num[0].to_i

    num.each_char do |char|
        if max < char.to_i
            max = char.to_i
        end
    end

    max
end


def not_coprime?(num1, num2)
    for i in 2..num2
        if num1 % i == 0 && num2 % i == 0
            return true
        end
    end

    return false
end


def get_smallest_divisor(num)
    for i in 2..num
        if num % i == 0
            return i
        end
    end
end


def sum_of_digits_less_than_5(num)
    s = 0

    while num > 0
        if num % 10 < 5
            s += num % 10
        end
        num /= 10
    end

    return s
end


def method_1(num)
    num = num.to_i
    counter = 0

    for i in 2...num
        if i.even? && not_coprime?(i, num)
            counter += 1
        end
    end

    return counter
end

puts method_1(35)  # -> 5
puts method_1(10)  # -> 4


def method_2(num)
    max_dig = max_digit(num)

    if max_dig % 3 != 0
        return max_dig
    else
        for i in 0...num.size
            num = num.delete(max_dig.to_s)
            max_dig = max_digit(num)
            if max_dig % 3 != 0
                return max_dig
            end
        end
    end
end


puts method_2("123")  # -> 2
puts method_2("987654321")  # -> 8


def method_3(num)
    num = num.to_i
    smallest_divisor = get_smallest_divisor(num)
    (num - 1).downto(2) do |i|
        if not_coprime?(i, num) && i % smallest_divisor != 0
            return i * sum_of_digits_less_than_5(num)
        end
    end
end


puts method_3("123")  # -> 492
puts method_3("725")  # -> 1392

num = ARGV[0]  # ruby task6.rb 123


puts sum(num)  # -> 6
puts product(num)  # -> 6
puts min_digit(num)  # -> 1
puts max_digit(num)  # -> 3