require 'slow_enumerator_tools'

def buf(input)
  SlowEnumeratorTools.buffer(input, 10)
end

def ls(options = {})
  open("| ls #{'-l' if options[:long]}").each.lazy.map do |l|
    puts "Reading #{l.inspect}"
    l
  end
end

def grep(input, regex)
  buf(input).select do |l|
    puts "Filtering #{l.inspect}"
    l =~ regex
  end
end

def count(input)
  total = 0
  buf(input).each do |l|
    puts "Counting #{l.inspect}"
    total += 1
  end
  total
end

p count(grep(ls(long: true), /^-.{8}x/))
