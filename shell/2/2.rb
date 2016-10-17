$stdin.each do |line|
  puts "‘Processing’ #{line}"
  sleep 0.99
  puts "Processed #{line}"
end
puts "Done receiving"
