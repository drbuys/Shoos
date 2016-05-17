require('minitest/autorun')
require('minitest/rg')
require_relative('../models/shoos.rb')

class TestShoo < MiniTest::Test

  def setup
    options = {'first_name' => 'Bobby', 'last_name' => 'Dazzler', 'style' => 'Leather Swagger', 'size' => 8, 'quantity' => 4}
    @shoo = Shoo.new(options)
  end

  def test_first_name
    assert_equal('Bobby', @shoo.first_name)
  end

  def test_last_name
    assert_equal('Dazzler', @shoo.last_name)
  end

  def test_pretty_name
    assert_equal('Bobby Dazzler', @shoo.pretty_name())
  end

  def test_style
    assert_equal('Leather Swagger', @shoo.style)
  end

  def test_size
    assert_equal(8, @shoo.size)
  end

  def test_quantity
    assert_equal(Fixnum, @shoo.quantity.class)
    assert_equal(4, @shoo.quantity)
  end


end
