module CodeJam
  class Pseudo
    attr_accessor :x, :y, :z, :zz
    def initialize(x, y, z)
      @x=x
      @y=y
      @z=z
      @zz=Array.new
    end
  end

  class TestCase
    attr_accessor :a, :b, :c, :d
    def initialize(a, b, c)
      @a=a
      @b=b
      @c=c
      @d=Array.new
    end

  end

  class Aiwar
    def initialize()
      problem_path="practice/2011-2-aiwar/"
      input = File.open("data/#{problem_path}input", "r")
      output = File.open("data/#{problem_path}output", "w")
      x = input.readline.to_i
      x.times do |i|
        a = input.readline.to_s.split(" ")
        b = input.readline.to_s.split(" ")
        testcase = TestCase.new(a[0], a[1], b)
        puts "Case:" +(i+1).to_s
        output.puts "Case ##{i+1}: #{solve(testcase)}"
      end
    end

    def check_connections(c,i)

    end

    def solve(input)
      puts "1"
      a=input.a
      b=input.b
      c=input.c
      d=input.d
      c.length.times do |i|
        one, two=c[i].to_s.split(",")
        one=one.to_i
        two=two.to_i
        if d.at(one).nil?
          d[one]=Pseudo.new(one, Array.new(1, two), :untouched)
        else
          d[one].y.push(two)
        end
        if d.at(two).nil?
          d[two]=Pseudo.new(two, Array.new(1, one), :untouched)
        else
          d[two].y.push(one)
        end
      end
      alien_found=false
      d[0].z=:ours
      d[0].zz << Array.new(1, 0)
      d[1].z=:alien
      conquer=0
      threaten=0
      counter=-1
      puts "2"
      while (!alien_found) do
        counter += 1
        helper=Array.new
        #puts "Counter" +counter.to_s
        a.to_i.times do |i|
          #puts helper.length
          if !d.at(i).nil?
            if d[i].z==:ours
              d[i].y.length.times do |j|
                neighbour=d[i].y[j].to_i
                if d[neighbour].z==:alien || d[neighbour].z==:untouched
                  if d[neighbour].z==:alien
                    alien_found=true
                    #puts "ALIENS FOUND!!" + counter.to_s
                  else
                    helper << neighbour
                  end
                  d[i].zz.length.times do |l|
                    temp = Array.new(d[i].zz[l])
                    temp << neighbour
                    #puts temp.to_s
                    d[neighbour].zz << temp
                  end
                end
              end
            end
            d[i].z==:counted
          end
        end
        helper.length.times do |k|
          #puts d[helper[k].to_int].z
          d[helper[k].to_int].z=:ours
        end
      end
      puts d[1].zz.length.to_s
      puts d[1].inspect
      d[1].zz.length.times do |i|
        tempthreaten=0
        a.to_i.times do |j|
          if !d.at(j).nil?
            if j==0 || d[1].zz[i].include?(j)
              d[j].z=:ours
            else
              d[j].z=:untouched
            end
            d[1].z=:untouched
          end
        end
        a.to_i.times do |j|
          if !d.at(j).nil?
            if d[j].z==:ours
              d[j].y.length.times do |k|
                neighbour=d[j].y[k].to_i
                if d[neighbour].z==:untouched
                  tempthreaten += 1
                  d[neighbour].z=:counted
                end
              end
            end
          end
        end
        if threaten < tempthreaten
          threaten=tempthreaten
        end
      end
      #puts input.inspect
      counter.to_s + " " + threaten.to_s
    end
  end
end


