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

puts method_2("3690123456789")