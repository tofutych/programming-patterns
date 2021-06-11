puts "Привет, #{ARGV[0]}!"
puts "#{ARGV[0]}, какой у вас любимый язык?"
answer = STDIN.gets.chomp

if answer == "Ruby" then puts "Ах ты подлиза!" else puts "но скоро им станет Ruby!" end