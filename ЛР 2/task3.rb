def input()
    puts "Введите #{ARGV[1]} элементов:"
    arr = []
    for _ in 0...(ARGV[1].to_i)
        arr << STDIN.gets.chomp.to_i
    end
    return arr
end


def add1(arr, elem)
    arr << elem
end


def add2(arr, elem)
    arr.unshift(elem)
end


def add3(arr, elem)
    arr.push(elem)
end


def add4(arr, elem)
    arr[arr.size] = elem
end


def add5(arr, elem)
    arr.concat([elem])
end


def add6(arr, elem)
    arr.insert(arr.size, elem)
end


def from_file(path)
    return File.read(path).split().map(&:to_i).to_a
end


def h()
    puts "Всего доступно 2 способа ввода списка."
    puts "Для выбора нужного способа просто добавьте его номер в параметр запуска программы."
    puts "\t1. С клавиатуры(во втором аргументе укажите количество элементов)"
    puts "\t2. Из файла(во втором аргументе укажите путь к файлу)"
    puts
end

def selector()
    if ARGV[0] == "1" && ARGV.size == 2
        puts "Вы ввели #{input()}"
    elsif ARGV[0] == "2" && ARGV.size == 2
        begin
            puts "#{from_file(ARGV[1])}"
        rescue
            puts "Некорректный путь!"
            puts
            h()
        end
    else
        puts "Некорректные параметры запуска!"
        puts
        h()
    end
end


def main()
    if ARGV.empty?
        puts "Используйте параметры запуска для работы с программой!"
        puts
        h()
    elsif ARGV[0] == '-h' && ARGV.size == 1
        h()
    else
        selector()
    end
end


main()


# arr = [1, 2, 3, 4, 5]
# add1(arr, 6)
# add2(arr, 0)
# add3(arr, 7)
# add4(arr, 8)
# add5(arr, 9)
# add6(arr, 10)
# print arr  # -> [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10]