# observer...

class PlantWatering
  attr_accessor :water

  def initialize
    @observers = []
    @water = 0
  end

  def add_observer(observer)
    @observers << observer
  end

  # TODO
  def delete_observer(observer)
    @observers.delete(observer)
  end

  def observer
    @observers.each do |observer|
      observer.watering(self)
    end
  end

  def add_water(addition)
    @water += addition
    observer
  end
end

class Cosmos
  BLOOM = 80

  def initialize
    @given = 0
  end

  def watering(plant_watering)
    if @given < BLOOM
      calc_water = (plant_watering.water - (BLOOM - @given))
      given_water = calc_water > 0 ? (BLOOM - @given) : plant_watering.water

      @given += given_water 
      plant_watering.water = (plant_watering.water - given_water)

      p "watering cosmos #{given_water}water."
    end

    if @given == BLOOM
      p "the cosmos is blooming"
      # plant_watering.delete_observer(self)
    else
      p "please #{BLOOM - @given}water for the cosmos."
    end
  end
end

class Azalea
  BLOOM = 30

  def initialize
    @given = 0
  end

  def watering(plant_watering)
    if @given < BLOOM
      calc_water = (plant_watering.water - (BLOOM - @given))
      given_water = calc_water > 0 ? (BLOOM - @given) : plant_watering.water

      @given += given_water 
      plant_watering.water = (plant_watering.water - given_water)

      p "watering the azalea #{given_water}water."
    end

    if @given == BLOOM
      p "the azalea is blooming"
      # plant_watering.delete_observer(self)
    else
      p "please #{BLOOM - @given}water for the azalea."
    end
  end
end

plant_watering = PlantWatering.new

cosmos = Cosmos.new
plant_watering.add_observer(cosmos)

azalea = Azalea.new
plant_watering.add_observer(azalea)

plant_watering.add_water(100)
plant_watering.add_water(5)