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


num = ARGV[0]

puts sum(num)
puts product(num)
puts min_digit(num)
puts max_digit(num)