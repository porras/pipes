def ls(options = {})
  output_queue = Queue.new
  Thread.new do
    open("| ls #{'-l' if options[:long]}").each do |l|
      puts "Reading #{l.inspect}"
      output_queue << l
    end
    output_queue.close
  end
  output_queue
end

def grep(input_queue, regex)
  output_queue = Queue.new
  Thread.new do
    while l = input_queue.pop
      puts "Filtering #{l.inspect}"
      output_queue << l if l =~ regex
    end
    output_queue.close
  end
  output_queue
end

def count(input_queue)
  total = 0
  output_queue = Queue.new
  Thread.new do
    while l = input_queue.pop
      puts "Counting #{l.inspect}"
      total += 1
    end
    output_queue << total
    output_queue.close
  end
  output_queue.pop
end

p count(grep(ls(long: true), /^-.{8}x/))
