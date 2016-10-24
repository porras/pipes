require 'forwardable'

class MyPipe
  extend Forwardable
  def_delegators :@queue, :<<, :pop
  def_delegators :@thread, :join

  def initialize(input = nil)
    @queue = Queue.new
    @thread = Thread.new do
      if input
        while l = input.pop
          yield(self, l)
        end
      else
        yield(self)
      end
      @queue.close
    end
  end
end

def ls(options = {})
  MyPipe.new do |p|
    open("| ls #{'-l' if options[:long]}").each do |l|
      puts "Reading #{l.inspect}"
      p << l
    end
  end
end

def grep(input, regex)
  MyPipe.new(input) do |p, l|
    puts "Filtering #{l.inspect}"
    p << l if l =~ regex
  end
end

def count(input)
  total = 0
  MyPipe.new(input) do |p, l|
    puts "Counting #{l.inspect}"
    total += 1
  end.join
  total
end

p count(grep(ls(long: true), /^-.{8}x/))
