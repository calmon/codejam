module CodeJam
  class ProblemA < Problem
    def initialize
      super("qualification2012/problem_a/")
    end

    def solve(input)
      output = ""
      input.each_char do |c|
        output << translate(c)
      end
      output
    end

    def translate(char)
      list = {
          'a' => 'y',
          'b' => 'h',
          'c' => 'e',
          'd' => 's',
          'e' => 'o',
          'f' => 'c',
          'g' => 'v',
          'h' => 'x',
          'i' => 'd',
          'j' => 'u',
          'k' => 'i',
          'l' => 'g',
          'm' => 'l',
          'n' => 'b',
          'o' => 'k',
          'p' => 'r',
          'q' => 'z',
          'r' => 't',
          's' => 'n',
          't' => 'w',
          'u' => 'j',
          'v' => 'p',
          'w' => 'f',
          'x' => 'm',
          'y' => 'a',
          'z' => 'q',
      }
      list.fetch(char)
    rescue KeyError
      char
    end
  end
end


