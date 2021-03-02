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

# puts method_2("123")  # -> 2
# puts method_2("987654321")  # -> 8



def method_3()
end
