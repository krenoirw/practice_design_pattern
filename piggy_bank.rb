# singleton...

class PiggyBank
  include Singleton

  def initialize
    @balance = 3000
  end

  def kotsukotsu(price)
    @balance += price
  end
end

class Box
  include Singleton

  def initialize
    @content ||= [:cherry, :banana, :mouse, :squirrel, :beetle, :butterfly].sample
  end

  def guess(content)
    if @content == content.to_sym
      p 'Bingo!'
      @content = [:cherry, :banana, :mouse, :squirrel, :beetle, :butterfly].sample
    else
      p 'Bad Luck!'
    end
  end
end