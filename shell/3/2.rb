$stdin.each do |line|
  sleep 1.0 / 5000
  puts "Processed #{line}" if line.to_i % 5000 == 0
end
puts "Done receiving"
