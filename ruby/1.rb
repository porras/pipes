def ls(options = {})
  `ls #{'-l' if options[:long]}`.split("\n")
end

def grep(input, regex)
  input.select { |l| l =~ regex }
end

def count(input)
  input.size
end

p count(grep(ls(long: true), /^-.{8}x/))
