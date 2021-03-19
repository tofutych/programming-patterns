def task12(path)
    data = File.open(path).readlines.map(&:chomp)
    return data.sort_by(&:length)
end


print task12("task12.txt")  # ["qwe qwe qwe", "qweeeeeeee", "qw qw"]  ——>  ["qw qw", "qweeeeeeee", "qwe qwe qwe"]