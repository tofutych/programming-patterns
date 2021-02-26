def sum_of_digits(num)
    sum = 0
    num.each_char do |char|
        sum += char.to_i
    end
    puts sum
end


sum_of_digits(ARGV[0])