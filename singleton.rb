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