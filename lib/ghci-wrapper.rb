class GHCi
  def initialize
    @interpreter = IO.popen('ghci', 'r+')
    4.times { puts @interpreter.gets }
  end
  def evaluate(str)
    @interpreter.puts str
    line = @interpreter.gets
    line.slice!(/.*> /)
    line.strip
  end
end

interpreter = GHCi.new
puts '----'
puts interpreter.evaluate ":t \"Chris\""
puts '----'
puts interpreter.evaluate "sum [1..(10::Int)]"
