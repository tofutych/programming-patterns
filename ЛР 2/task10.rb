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
    
end

puts task11("123qweQWE321")