# adapter...

class Light
  attr_accessor :charge

  W = 2

  def initialize(connect)
    @connect = connect
    @charge = 0
    @on = false
  end

  def turn_on
  end

  def turn_off
  end

  def charge
  end

  def switch_connect(connect)
    @connect = connect
    @on = false
  end

  private

  def on?
    @on
  end

  def off?
    !@on
  end
end

class AcAdapter
  W_MAX = 20
 
  def initialize
    @connections = []
  end

  def on(light)
    @connections << light
  end

  def off(light)
    @connections.delete(light)
  end

  def amount_consumed_electric_power
  end
end

class Default
  def initialize
  end

  def on(light)
  end

  def off(light)
  end

  def amount_consumed_electric_power
  end
end

connect = Default.new
light = Light.new(connect)

light.turn_on
light.turn_off
light.charge

connect2 = AcAdapter.new
light2 = Light.new(connect2)

light.turn_on
light.turn_off
light.charge
light.switch_connect(connect)
light.turn_on


