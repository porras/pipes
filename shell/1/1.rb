(1..5).each do |i|
  $stderr.puts "Sending #{i}"
  $stdout.puts i
  $stdout.flush   # None of these 2 lines are in the examples in the slides
  sleep 0.0001    # See comment below
end
$stderr.puts "Done sending"

# Thanks to optimizations in the implementations at the OS level, there are some behaviors that apply to pipes in general
# (those that the talk was about, among others), that don't show with small amounts of data, because it's more efficient
# to avoid the context switchesand so on. With this small additions (forcing the sending of the data regardless of how full
# the buffer is, and waiting a bit before sending more), those behaviors emerge again. You might need to play with the amount
# of sleep depending on your OS and hardware
#
# There are other similar small differences for the same reasons in other examples, which I haven't annotated there. Drop
# me a line if there's any of them you're curious about :)
