require("minitest/autorun")
require_relative("../bus")
require_relative("../person")
require_relative("../bus_stop")

class BusStopTest < MiniTest::Test

  def setup
    @bus = Bus.new( 32, [@marchmont, @newington, @princes_street], [] )
    @personx = Person.new("Simon", 56)
    @persony = Person.new("Robb", 30)
    @personz = Person.new("Daniel", 32)
    @marchmont = BusStop.new( "Strathearn Road", [] )
    # @newington = BusStop.new( "The Abbey", [] )
    # @princes_street = BusStop.new( "Boots", [] )
  end

  def test_bus_stop_name
    assert_equal("Strathearn Road", @marchmont.name)
  end

  def test_queue_count
    assert_equal(0, @marchmont.queue_count)
  end

  def test_add_person_to_queue
    @marchmont.add_person_to_queue([@personx])
    assert_equal(1, @marchmont.queue_count)
  end

  def test_remove_from_queue
    @marchmont.add_person_to_queue([@personx])
    @marchmont.remove_person_from_queue([@personx])
    assert_equal(0, @marchmont.queue_count)
  end

  def test_bus_route_number
    assert_equal(32, @bus.route_number)
  end

  def test_pick_up_first_passenger
    # arrange
    @marchmont.add_person_to_queue([@personx, @persony, @personz])
    # act
    @bus.pick_up_from_stop(@marchmont)
    # assert
    assert_equal(0, @marchmont.queue_count)
    assert_equal(3, @bus.passenger_count)
  end

end
