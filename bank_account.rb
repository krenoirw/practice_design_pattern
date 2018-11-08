# proxy...

class BankAccount
  attr_reader :balance

  def initialize(starting_balance = 0)
    @balance = starting_balance
  end

  def deposit(amount)
    @balance += amount
  end

  def withdraw(amount)
    @balance -= amount
  end
end

class CreditCard
  attr_reader :point

  MAX = 100000

  def initialize(account)
    @account = account
    @point = 0
  end

  def balance
    @account.balance
  end

  def deposit(amount)
    @account.deposit(amount)
  end

  def withdraw(amount)
    if @account.balance < 0
      p "the withdraw is cancelled"
    elsif amount > MAX
      p "overed #{MAX}"
    else
      @account.withdraw(amount)
      @point += (amount * 0.5).to_i
    end
  end
end