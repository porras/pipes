(1..5).each do |i|
  $stderr.puts "‘Calculating’ #{i}"
  sleep 1
  $stderr.puts "Sending #{i}"
  $stdout.puts i
  $stdout.flush
end
$stderr.puts "Done sending"
