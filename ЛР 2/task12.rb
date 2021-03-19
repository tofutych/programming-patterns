def task12(path)
    data = File.open(path).readlines.map(&:chomp)
    return data.sort_by(&:length)
end


print task12("task12.txt")  # ["qwerty", "qwert", "qwer", "qwe", "qw", "q"]  ——>  ["q", "qw", "qwe", "qwer", "qwert", "qwerty"]