def ls(options = {})
  Enumerator.new do |e|
    open("| ls #{'-l' if options[:long]}").each do |l|
      puts "Reading #{l.inspect}"
      e << l
    end
  end
end

def grep(input, regex)
  Enumerator.new do |e|
    input.each do |l|
      puts "Filtering #{l.inspect}"
      e << l if l =~ regex
    end
  end
end

def count(input)
  total = 0
  input.each do |l|
    puts "Counting #{l.inspect}"
    total += 1
  end
  total
end

p count(grep(ls(long: true), /^-.{8}x/))
