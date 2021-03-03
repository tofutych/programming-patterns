print "Введите команду ОС: "
os_command = STDIN.gets.chomp
system(os_command)

print "Введите команду Ruby: "
ruby_command = STDIN.gets.chomp
system("ruby -e \"#{ruby_command}\"")
