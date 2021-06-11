def extract_date(str)
    return str.scan(%r"([1-9]|[12][\d]|[3][01]) (декабря|января|февраля|марта|апреля|мая|июня|июля|августа|сентября|октября|ноября) ([1-9]{1}\d{3})")
end


def task4(str)
    return str.scan(/\d+/).map(&:to_i).select{|n| n < 5}.size
end


def task11(str)
    return "Незадействованы все кроме #{str.scan(%r"[0-9A-Za-z]").uniq}"
end


def task15(str)
    return str.scan(/\d+/).map(&:to_i).select{|n| n > 5}.size
end


def input_string()
    print "Введите строку: "
    return STDIN.gets.chomp
end


def main()
    puts "Выбирай ченить:"
    puts "\t1. Колво чисел строки < 5"
    puts "\t2. Незадействованная латиница"
    puts "\t3. Колво чисел строки > 5"
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
end


puts main()