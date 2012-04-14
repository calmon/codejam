module CodeJam
  class Solve
    def initialize(problem)
      CodeJam.const_get(problem).new
    end
  end
end
