class Bus

  attr_reader(:route_number, :destination, :passengers)

  def initialize(route_number, destination, passengers)
    @route_number = route_number
    @destination = destination
    @passengers = passengers
  end

  def drive
    return "Brum Brum!"
  end

  def passenger_count
    return @passengers.count
  end

  def pick_up(passengers)
    for passenger in passengers do
    @passengers.push(passenger)
    end
  end

  def drop_off(passenger)
    @passengers.delete(passenger)
  end

  def empty()
    @passengers.clear()
  end

  def pick_up_from_stop(stop)
    pick_up(stop.queue)
    stop.clear_queue
  end

end
