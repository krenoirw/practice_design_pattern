# decorator...

class IceCream
  
  def initialize(ice_cream)
    @ice_cream = ice_cream
  end

  def ready(text)
    p text
    @ice_cream.ready(text)
  end

  def complete
    p "=== complete ==="
  end
end

class ChocolateIceCream < IceCream

  def ready(text)
    t = text + get_base
    p t
    @ice_cream.ready(t)
  end

  def get_base
    " Chocolate"
  end
end

class ChocoChipIceCream < IceCream

  def ready(text)
    t = get_topping + text
    p t
    @ice_cream.ready(t)
  end

  def get_topping
    "ChocoChip "
  end
end

class Shop
  def ready(text)
    p "Thank you"
  end
end


ice_cream = IceCream.new(ChocolateIceCream.new(ChocoChipIceCream.new(Shop.new)))
ice_cream.ready("== IceCream ==")
ice_cream.complete

