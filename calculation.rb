# command...

class CompositCalculation
  def initialize
    @commands = []
  end

  def add_command(cmd)
    @commands << cmd
  end

  def execute
    @commands.each(&:execute)
  end

  def unexecute
    @commands.each(&:unexecute)
  end

  def result
    result = ''
    @commands.each { |cmd| result += cmd.result + "\n" }
    description
  end
end

class AddCalculation
  attr_reader :result
  def initialize(default, step)
    @result = default
    @step = step
  end

  def execute
    @result += step
  end

  def unexecute
    @result -= step
  end
end

class SubtractCaluculation
  attr_reader :result
  def initialize(default, step)
    @result = default
    @step = step
  end

  def execute
    @result -= step
  end

  def unexecute
    @result += step
  end
end

class MultiplyCaluculation
  attr_reader :result
  def initialize(default, step)
    @result = default
    @step = step
  end

  def execute
    @result *= step
  end

  def unexecute
    @result /= step
  end
end

class DividedByCaluculation
  attr_reader :result
  def initialize(default, step)
    @result = default
    @step = step
  end

  def execute
    @result /= step
  end

  def unexecute
    @result *= step
  end
end