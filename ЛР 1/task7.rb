def method_1(num)
    num = num.to_i
    counter = 0

    for i in 2...num
        if i.even?
            acc = 0
            for j in 2..i
                if num % j == 0 && i % j == 0
                    counter += 1
                    break
                end
            end
            if acc != 0
                counter += 1
            end
        end
    end

    puts counter
end

method_1(35)  # -> 5
method_1(10)  # -> 4


def method_2(num)
    num = num.to_i
    max_digit = -1

    while num > 0
        digit = num % 10
        if digit > max_digit && digit % 3 != 0 then
            max_digit = digit
        end
        num /= 10
    end

    if max_digit == -1 then return "Такой цифры нет" else return max_digit end
end

puts method_2("123")  # -> 2
puts method_2("987654321")  # -> 8



def method_3(num)
    num = num.to_i
    sum = 0
    smallest_divisor = nil
    max_num = nil

    for i in 2..num
        if num % i == 0
            smallest_divisor = i
            break
        end
    end

    (num - 1).downto(2) do |i|
        for j in 2..i
            if num % j == 0 && i % j == 0 && i % smallest_divisor != 0
                max_num = i
                break
            end
        end
    end
    
    while num > 0
        if num % 10 < 5
            sum += num % 10
        end
        num /= 10
    end
    puts max_num * sum
end

method_3(123)  # -> 245
method_3(725)  # -> 245
