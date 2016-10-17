sleep 1
(1..50000).each do |i|
  $stderr.puts "Sending #{i}" if i % 5000 == 0
  $stdout.puts i
end
$stderr.puts "Done sending"
