# builder...

class LanchSet
  def initialize
    @lanch = Lanch.new
  end

  def add_main(main)
    @lanch.main = main
  end

  def add_salada(salada)
    @lanch.salada = salada
  end

  def add_drink(drink)
    @lanch.drink = drink
  end

  def describe
    # TODO
  end
end

class Lanch
  attr_accessor :main, :salada, :drink
  def initialize(main = nil, salada = nil, drink = nil)
    @main = main
    @salada = salada
    @drink = drink
  end
end

class Main
  def name
    p "白米"
  end
end

class Salada
  def name
    p "和風サラダ"
  end
end

class Drink
  def name
    p "ウーロン茶"
  end
end
