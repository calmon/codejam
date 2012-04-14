module CodeJam
  class Problem
    def initialize(problem_path)
      input = File.open("data/#{problem_path}input", "r")
      output = File.open("data/#{problem_path}output", "w")
      x = input.readline.to_i
      x.times do |i|
        output.puts "Case ##{i+1}: #{solve(input.readline.to_s)}"
      end
    end
  end
end