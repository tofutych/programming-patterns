def from_file(path)
    return File.read(path).split().map(&:to_i)
end


def from_kb()
    arr = STDIN.gets.chomp
    return arr.split().map(&:to_i)
end


def task10(arr1, arr2)
    counter = 0

    for i in 0...arr1.size
        for j in 0...arr2.size
            if arr1[i] == arr2[j]
                counter += 1
            end
        end
    end

    return counter
end


def task22()


end


def main()
    puts "Выберите задачу:"
    puts "\t1. "
    puts "\t2. "
    puts "\t3. "
    puts "\t4. "
    puts "\t5. "
    answer = STDIN.gets.chomp

    case answer
    when "1"
        puts "Выберите способа задания массива"
        puts "\t1. С клавиатуры"
        puts "\t2. С файла"
        way = STDIN.gets.chomp
    
        if way == "1"
            print "Введите элементы первого массива: "
            arr1 = from_kb()
            print "Введите элементы второго массива: "
            arr2 = from_kb()
        elsif way == "2"
            print "Введите путь до файла с первым массивом: "
            arr1 = from_file(STDIN.gets.chomp)
            print "Введите путь до файла с вторым массивом: "
            arr2 = from_file(STDIN.gets.chomp)
        end

        task10(arr1, arr2)

    when "2"

    when "3"

    when "4"

    when "5"

    end
end

puts main()