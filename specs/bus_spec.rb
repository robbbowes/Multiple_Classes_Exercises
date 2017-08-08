require("minitest/autorun")
require_relative("../bus")
require_relative("../person")
require_relative("../bus_stop")

class BusTest < MiniTest::Test

  def setup
    @passenger1 = Person.new("Harrison", 25)
    @passenger2 = Person.new("Jay", 27)
    @boris = Bus.new(22, "Ocean Terminal", [])
  end

  def test_bus_route_number
    assert_equal(22, @boris.route_number)
  end

  def test_bus_destination
    assert_equal("Ocean Terminal", @boris.destination)
  end

  def test_drive
    assert_equal("Brum Brum!", @boris.drive)
  end

  def test_passenger_count
    assert_equal(0, @boris.passenger_count)
  end

  def test_pick_up
    @boris.pick_up(@passenger1)
    assert_equal(1, @boris.passenger_count)
  end

  def test_drop_off
    @boris.pick_up(@passenger1)
    @boris.drop_off(@passenger1)
    assert_equal(0, @boris.passenger_count)
  end

  def test_empty
    @boris.pick_up(@passenger1)
    @boris.pick_up(@passenger2)
    @boris.empty
    assert_equal(0, @boris.passenger_count)
  end

end
