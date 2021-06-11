def is_num?(str)
    true if Integer(str) rescue false
end


def counter(str)
    log = []
    m = 0

    str.split("").each do |s|
        if is_num?(s)
            m += 1
            log.push(m)
        else
            m = 0
        end
    end

    return log.max
end

puts counter(STDIN.gets.chomp)