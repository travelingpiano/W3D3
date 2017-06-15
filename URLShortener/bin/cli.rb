puts "hey, what's your email?"
user_email = gets.chomp
user1 = User.find_by(email: user_email)
puts "what do you want to do?"
puts "input 1 if you want to visit a shortened URL"
puts "input 2 if you want to create one"
choice1 = gets.chomp
if choice1.to_i == 1
  puts "type out the short url. Good luck :P"
  short_url1 = gets.chomp
  short1 = ShortenedUrl.find_by(short_url: short_url1)
  Visit.record_visit!(user1,short1)
  puts "Visit recorded. Goodbye!"
elsif choice1.to_i == 2
  puts "type out the long url"
  long_url = gets.chomp
  short2 = ShortenedUrl.new_shortened_url(user1,long_url)
  puts "Short Url is #{short2.short_url}"
  puts "Goodbye"
else
  raise "Input one or two"
end
