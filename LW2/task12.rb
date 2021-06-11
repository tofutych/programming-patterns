def task12(path)
    data = File.open(path).readlines.map(&:chomp)
    return data.sort_by(&:length)
end


def task13(path)
    data = File.open(path).readlines.map(&:chomp)
    return data.sort_by{|x| x.split.count}
end


print task12("task12.txt")  # ["qwe qwe qwe", "qweeeeeeee", "qw qw"]  ——>  ["qw qw", "qweeeeeeee", "qwe qwe qwe"]
print task13("task12.txt")  # ["qwe qwe qwe", "qweeeeeeee", "qw qw"]  ——>  ["qweeeeeeee", "qw qw", "qwe qwe qwe"]