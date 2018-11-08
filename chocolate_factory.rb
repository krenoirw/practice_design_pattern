# factory...

class ChocolateFactory
  def initialize
    @items = []
  end

  def get_chocolate(type)
    item = case type
           when :bar
             ChocolateBar.new
           when :candy
             ChocolateCandy.new
           when :ice
             ChocolateIce.new
           end
    @items << item
    item
  end

  def total_price
    p @items.map(&:price).inject(:+)
  end
end

class ChocolateBar
  def draw
    p "chocolate bar"
  end

  def price
    120
  end
end

class ChocolateCandy
  def draw
    p "chocolate candy"
  end

  def price
    30
  end
end

class ChocolateIce
  def draw
    p "chocolate Ice"
  end

  def price
    140
  end
end

chocolate_factory = ChocolateFactory.new

chocobar = chocolate_factory.get_chocolate(:bar)
chocobar.draw

chococandy = chocolate_factory.get_chocolate(:candy)
chococandy.draw

chocoice = chocolate_factory.get_chocolate(:ice)
chocoice.draw

chocolate_factory.total_price
