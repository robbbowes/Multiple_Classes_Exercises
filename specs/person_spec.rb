require('minitest/autorun')
require_relative("../bus")
require_relative("../person")

class PersonTest < MiniTest::Test

  def setup
    @person1 = Person.new('Craig', 26)
  end

  def test_person_has_name
    assert_equal('Craig', @person1.name)
  end

  def test_person_has_age
    assert_equal(26, @person1.age)
  end

end
