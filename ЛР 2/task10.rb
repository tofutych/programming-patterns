def extract_date(str)
    return str.scan(%r"([1-9]|[12][\d]|[3][01]) (декабря|января|февраля|марта|апреля|мая|июня|июля|августа|сентября|октября|ноября) ([1-9]{1}\d{3})")
end


def task4(str)
    return str.scan(/\d+/).map(&:to_i).select{|n| n < 5}.size
end

print(task4("q1w2e3r4t5y6u0"))