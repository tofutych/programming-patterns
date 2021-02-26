print "Введите команду ОС: "
os_command = STDIN.gets.chomp
print "Введите команду Ruby: "
ruby_command = STDIN.gets.chomp
puts system(os_command)