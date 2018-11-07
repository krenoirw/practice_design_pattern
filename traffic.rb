# mediator...

class Traffic
  # 前提：3 * 3 のマス目
  # ┌──┬──┬──┐
  # │1 │2 │3 │
  # ├──┼──┼──┤
  # │4 │5 │6 │
  # ├──┼──┼──┤
  # │7 │8 │9 │
  # └──┴──┴──┘

  attr_reader :traffic_count

  def initialize
    @traffic_count = 0

    @vehicle = []
  end

  def add_vehicle(vehicle)
    @vehicle << vehicle
    @traffic_count += 1
  end

  def shift_traffic(direction, vehicle)
    shift = case direction
            when :right
              1
            when :left
              -1
            when :forward
              3
            when :back
              -3
            else
              0
            end
    new_point = vehicle.point + shift

    if new_point > 0 && new_point < 10
      vehicle.point = new_point
    else
      p "Bad direction"
    end 
  end

  # TODO マス目を表示させる
  def commit_traffic
    points = @vehicle.map(&:point)

    # 同じマス目にいたらbad traffic
    if points.count == points.uniq.count
      p "safe traffic"
    else
      p "bad traffic"
    end
  end
end

class Car
  attr_accessor :point, :code

  def initialize(traffic, default_point = 1)
    @traffic = traffic
    @point = default_point
    @code = "1"
    @traffic.add_vehicle(self)

    p "A car entered"
    p "traffic count: #{@traffic.traffic_count}"
  end

  def shift(direction)
    @traffic.shift_traffic(direction, self)  
  end
end

class Track
  attr_accessor :point

  def initialize(traffic, default_point = 0)
    @traffic = traffic
    @point = default_point
    @code = "2"
    @traffic.add_vehicle(self)

    p "A track entered"
    p "traffic count: #{@traffic.traffic_count}"
  end

  def shift(direction)
    @traffic.shift_traffic(direction, self)  
  end
end

traffic = Traffic.new

car = Car.new(traffic, 1)
track = Track.new(traffic, 8)

car.shift(:right)
track.shift(:left)
traffic.commit_traffic

car.point = 1
track.point = 1
car.shift(:right)
track.shift(:right)
traffic.commit_traffic
