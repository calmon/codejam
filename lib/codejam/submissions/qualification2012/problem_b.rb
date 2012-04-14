module CodeJam
  class ProblemB < Problem
    def initialize
      super("qualification2012/problem_b/")
    end

    def solve(input)
      input_split = input.split(' ')
      hits = 0
      googlers = input_split[0].to_i
      surprises = input_split[1].to_i
      checkresult = input_split[2].to_i*3
      googlers.times do |i|
        total = input_split[i+3].to_i
        if (total+2>=checkresult)
          hits+=1
        else
          if (total+4>=checkresult && surprises>0 && checkresult>3)
            hits+=1
            surprises-=1
          end
        end
      end
      hits
    end
  end
end


