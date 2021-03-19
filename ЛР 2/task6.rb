def from_file(path)
    return File.read(path).split().map(&:to_i)
end


def from_kb()
    return STDIN.gets.chomp.split().map(&:to_i)
end


def way_selector()
    puts "Выберите способа задания массива"
    puts "\t1. С клавиатуры"
    puts "\t2. С файла"
    way = STDIN.gets.chomp

    if way == "1"
        print "Введите элементы массива: "
        arr = from_kb()
    elsif way == "2"
        print "Введите путь до файла с массивом: "
        arr = from_file(STDIN.gets.chomp)
    end

    return arr
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


def task22(arr, a, b)
    min = arr[a + 1]
    counter = 0

    for i in (a + 1)...b
        if min > arr[i] 
            min = arr[i]
        end
    end

    for i in (a + 1)...b
        if arr[i] == min
            counter += 1
        end
    end

    return counter
end


def task34(arr, a, b)
    section = (a..b).to_a
    result = Array.new

    for i in 0...arr.size
        for j in 0...section.size
            if arr[i] == section[j]
                result.push(arr[i])
                break
            end
        end
    end

    return result
end


def task46(arr)
    result = Array.new

    for i in 0...arr.size
        if arr[i] > 0
            result.insert(0, arr[i])
        elsif arr[i] < 0
            result.push(arr[i])
        end
    end

    return result
end


def task58(arr)
    counter = 0

    for i in 0...arr.size
        flag = true
        temp_arr = Array.new(arr)
        temp_arr.delete_at(i)
        for j in 0...temp_arr.size
            for k in (j + 1)...temp_arr.size
                if temp_arr[j] + temp_arr[k] != arr[i]
                    flag = false
                end
            end
        end
        if flag
            puts arr[i]
            counter += 1
        end
    end

    return  counter
end


def main()
    puts "Выберите задачу:"
    puts "\t1. 6.10"
    puts "\t2. 6.22"
    puts "\t3. 6.34"
    puts "\t4. 6.46"
    puts "\t5. 6.58"
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
        return task10(arr1, arr2)
    when "2"
        arr = way_selector()
        print "Введите (a, b) через пробел: "
        a, b = STDIN.gets.chomp.split.map(&:to_i)
        return task22(arr, a, b)
    when "3"
        arr = way_selector()
        print "Введите [a, b] через пробел: "
        a, b = STDIN.gets.chomp.split.map(&:to_i)
        return task34(arr, a, b)
    when "4"
        arr = way_selector()
        return task46(arr)
    when "5"
        arr = way_selector()
        return task58(arr)
    else
        return "Чето не то выбрал, друг."
    end
end


puts main()