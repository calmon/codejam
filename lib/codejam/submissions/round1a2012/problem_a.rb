module CodeJam
  class Password
    attr_accessor :a, :b, :odds
    def initialize(a, b, odds)
      @a=a
      @b=b
      @odds=odds
    end

  end

  class ProblemA
    def initialize()
      problem_path="round1a2012/problem_a/"
      input = File.open("data/#{problem_path}input", "r")
      output = File.open("data/#{problem_path}output", "w")
      x = input.readline.to_i
      x.times do |i|
        a = input.readline.to_s.split(" ")
        b = input.readline.to_s.split(" ")
        password = Password.new(a[0], a[1], b)
        output.puts "Case ##{i+1}: #{solve(password)}"
      end
    end

    def solve(input)
      best=[input.b.to_i + 2, input.a.to_i + input.b.to_i+1].min
      correct_chance=1
      input.a.to_i.times do |i|
        correct_chance=input.odds[i].to_f*correct_chance
        keysneeded=input.b.to_i-input.a.to_i+1+(input.a.to_i-(i+1))*2
        value=correct_chance*(keysneeded)+(1-correct_chance)*(keysneeded+input.b.to_i+1)
        if value<best
          best=value
        end
      end
      best
    end
  end
end


