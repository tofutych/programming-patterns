puts "Hello world" # the most loneliest day of my life

puts "Привет, #{ARGV[0]}!"

puts "#{ARGV[0]}, какой у вас любимый язык?"
answer = STDIN.gets.chomp

case answer
when "Ruby"
  puts "Подлиза"
when "Python"
  puts "Хватит душить змея... Скоро будет Ruby"
when "C++" 
  puts "Подлечись, ведь скоро им станет Ruby"
else
  puts "Скоро будет Ruby"
end
