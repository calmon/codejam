module CodeJam
  class ProblemC < Problem
    def initialize
      super("qualification2012/problem_c/")
    end

    def solve(input)
      input_split = input.split(' ')
      hits = 0
      a = input_split[0].to_i
      b = input_split[1].to_i
      list = Array.new
      rounds = b-a+1
      rounds.times do |i|
        check = a+i
        temp = ""
        it = check.to_s.length-1
        it.times do |j|
          temp = check.to_s[it-j] + temp
          if (temp[0].to_i!=0)
            recycled = (temp + check.to_s[0,it-j]).to_i
            if (check < recycled && recycled <= b)
              if (!list.include?(check.to_s + ',' + recycled.to_s))
                list.push(check.to_s + ',' + recycled.to_s)
                hits += 1
              end
            end
          end
        end
      end
      hits
    end
  end
end


