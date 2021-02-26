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
    num.to_s.split("").min
end


def max_digit(num)
    num.to_s.split("").max
end


num = ARGV[0]

sum(ARGV[0])
product(ARGV[0])
min_digit(ARGV[0])
max_digit(ARGV[0])