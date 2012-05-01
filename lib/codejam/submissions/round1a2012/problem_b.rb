module CodeJam
  class Problem
    def initialize(problem_path)
      input = File.open("data/#{problem_path}input", "r")
      output = File.open("data/#{problem_path}output", "w")
      x = input.readline.to_i
      x.times do |i|
        y = input.readline.to_i
        datasets = Array.new
        y.times do |j|
          a = input.readline.to_s.split(" ")
          datasets.push(Level.new(a[0], a[1]))
        end
        output.puts "Case ##{i+1}: #{solve(datasets)}"
      end
    end
  end

  class Level
    attr_accessor :one, :two, :onefinished
    def initialize(one, two)
      @one = one
      @two = two
      @onefinished = false
    end
  end

  class ProblemB < Problem
    def initialize
      super("round1a2012/problem_b/")
    end

    def solve(input)
      stars=0
      actions=0
      nothinghappen=true
      needtosolve=input.length
      while needtosolve>0 do
        needtosolve.times do |i|
          if input[i].two.to_i <= stars
            if (input[i].onefinished)
              stars+=1
            else
              stars+=2
            end
            needtosolve-=1
            actions+=1
            nothinghappen=false
            input.delete_at(i)
            break
          end
        end

        if (nothinghappen)
          j=-1
          max=-1
          needtosolve.times do |i|
            if input[i].one.to_i <= stars && input[i].two.to_i>max && !input[i].onefinished
              max=input[i].two.to_i
              j=i
            end
          end
          if (j>=0)
            stars+=1
            actions+=1
            nothinghappen=false
            input[j].onefinished=true
          end
        end

        if (nothinghappen)
          actions="Too Bad"
          break
        else
          nothinghappen=true
        end
      end
      actions
    end
  end
end


