def get_max_num(str)
    return str.split().map(&:to_i).max
end


def task4(str)
    str == str.reverse
end


def task11(str)
    str.split().size
end


def task15(str)
    return str.split("").uniq.size
end


def input_string()
    print "Введите строку: "
    return STDIN.gets.chomp
end


def main()
    puts "Выбирай ченить:"
    puts "\t1. Палиндром ли?"
    puts "\t2. Количество слов в строке"
    puts "\t3. Количество разных цифр числа"
    answer = STDIN.gets.chomp

    case answer
    when "1"
        str = input_string()
        return task4(str)
    when "2"
        str = input_string()
        return task11(str)
    when "3"
        str = input_string()
        return task15(str)
    else
        return "Чето не то выбрал, друг."
end


puts "Ответ: #{main()}"