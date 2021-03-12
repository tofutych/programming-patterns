require 'colorize'

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
    if num1 > num2
        num1, num2 = num2, num1
    end
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

    s
end


def method_1(num)
    num = num.to_i
    counter = 0

    for i in 2...num
        if i.even? && not_coprime?(i, num)
            counter += 1
        end
    end

    counter
end


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


def method_3(num)
    num = num.to_i
    smallest_divisor = get_smallest_divisor(num)
    (num - 1).downto(2) do |i|
        if not_coprime?(i, num) && i % smallest_divisor != 0
            return i * sum_of_digits_less_than_5(num)
        end
    end
end


def problem_20(num = 100)
    return sum((1..num).inject(:*).to_s)
end


def problem_40()
    d = (0 .. 200_000).to_a.join
    return [d[1], d[10], d[100], d[1_000], d[10_000], d[100_000], d[1000_000]].map(&:to_i).inject(:*)
end


def selector()
    for argv in ARGV
        case argv
        when "1"
            print "Вы выбрали sum(num)\n\tВведите num: "
            num = STDIN.gets.chomp
            puts "\tРезультат: #{sum(num)}".blue
            puts 
        when "2"
            print "Вы выбрали product(num)\n\tВведите num: "
            num = STDIN.gets.chomp
            puts "\tРезультат: #{product(num)}".blue
            puts
        when "3"
            print "Вы выбрали min_digit(num)\n\tВведите num: "
            num = STDIN.gets.chomp
            puts "\tРезультат: #{min_digit(num)}".blue
            puts
        when "4"
            print "Вы выбрали max_digit(num)\n\tВведите num: "
            num = STDIN.gets.chomp
            puts "\tРезультат: #{max_digit(num)}".blue
            puts
        when "5"
            print "Вы выбрали not_coprime?(num1, num2)\n\tВведите num1, num2(через пробел): "
            nums = STDIN.gets.chomp.split()
            num1 = nums[0].to_i
            num2 = nums[1].to_i
            puts "\tРезультат: #{not_coprime?(num1, num2)}".blue
            puts
        when "6"
            print "Вы выбрали get_smallest_divisor(num)\n\tВведите num: "
            num = STDIN.gets.chomp.to_i
            puts "\tРезультат: #{smallest_divisor(num)}".blue
            puts
        when "7"
            print "Вы выбрали sum_of_digits_less_than_5(num)\n\tВведите num: "
            num = STDIN.gets.chomp.to_i
            puts "\tРезультат: #{sum_of_digits_less_than_5(num)}".blue
            puts
        when "8"
            print "Вы выбрали method1(num)\n\tВведите num: "
            num = STDIN.gets.chomp
            puts "\tРезультат: #{method_1(num)}".blue
            puts
        when "9"
            print "Вы выбрали method2(num)\n\tВведите num: "
            num = STDIN.gets.chomp
            puts "\tРезультат: #{method_2(num)}".blue
            puts
        when "10"
            print "Вы выбрали method3(num)\n\tВведите num: "
            num = STDIN.gets.chomp
            puts "\tРезультат: #{method_3(num)}".blue
            puts
        when "11"
            print "Вы выбрали problem_20()"
            puts
            puts "\tРезультат: #{problem_20()}".blue
            puts
        when "12"
            print "Вы выбрали problem_40()"
            puts
            puts "\tРезультат: #{problem_40()}".blue
            puts
        when "-h"
            h()
        else
            puts "Такой функции нет.".red
            puts
            h()
        end
    end
end


def h()
    puts "Всего доступно 12 функций.\nЧтобы вызвать какую-либо из них, в параметрах запуска укажите " + "номер функции и необходимые значения.\n".red
    puts "\t1.  sum(num) — сумма цифр числа num"
    puts "\t2.  product(num) — произведение цифр числа num"
    puts "\t3.  min_digit(num) — минимальная цифра числа num"
    puts "\t4.  max_digit(num) — максимальная цифра числа num"
    puts "\t5.  not_coprime?(num1, num2) — не взаимная простота чисел num1 и num2"
    puts "\t6.  get_smallest_divisor(num) — минимальный делитель числа num"
    puts "\t7.  sum_of_digits_less_than_5(num) — сумма чисел числа, которые меньше 5"
    puts "\t8.  method1(num) — Количество четных чисел, не взаимно простых с числом num".blue  # 35 - > 5, 10 -> 4
    puts "\t9.  method2(num) — Максимальная цифру числа num, не делящуюся на 3".blue  # 123 -> 2, 987654321 -> 3
    puts "\t10. method3(num) — Поизведение максимального числа, не взаимно простого с num, не делящегося на наименьший делитель исходного числа num, и суммы цифр числа num, меньших 5".blue  # 123 -> 492, 725 -> 1392
    puts "\t11. problem_20() — Сумма цифр 100!".yellow
    puts "\t12. problem_40() — Постоянная Чемперноуна".yellow
    puts
end


def main
    if ARGV.empty?
        puts "Используйте параметры запуска для работы с программой!".red
        puts
        h()
    end

    if ARGV[0] == '-h' && ARGV.size == 1
        h()
    else
        selector()
    end
end


main()