require File.expand_path("../test_helper", __FILE__)
require File.expand_path("../../lib/checkout", __FILE__)

class TestCheckout < Minitest::Test
  def setup
    @checkout = Checkout.new(
      prices: { voucher: 500, tshirt: 2000, mug: 750 },
      discounts: { voucher: "2-for-1", tshirt: "bulk_discount" }
    )
  end

  def test_voucher
    @checkout.scan("VOUCHER")
    price = @checkout.total
    assert_equal "5.00€", price
  end

  def test_tshirt
    @checkout.scan("TSHIRT")
    price = @checkout.total
    assert_equal "20.00€", price
  end

  def test_mug
    @checkout.scan("MUG")
    price = @checkout.total
    assert_equal "7.50€", price
  end

  def test_multiple_mugs
    @checkout.scan("MUG")
    @checkout.scan("MUG")
    @checkout.scan("MUG")
    price = @checkout.total
    assert_equal "22.50€", price
  end

  def test_one_of_each
    @checkout.scan("VOUCHER")
    @checkout.scan("TSHIRT")
    @checkout.scan("MUG")
    price = @checkout.total
    assert_equal "32.50€", price
  end

  def test_voucher_discount
    @checkout.scan("VOUCHER")
    @checkout.scan("TSHIRT")
    @checkout.scan("VOUCHER")
    price = @checkout.total
    assert_equal "25.00€", price
  end

  def test_voucher_discount
    @checkout.scan("TSHIRT")
    @checkout.scan("TSHIRT")
    @checkout.scan("TSHIRT")
    @checkout.scan("VOUCHER")
    @checkout.scan("TSHIRT")
    price = @checkout.total
    assert_equal "81.00€", price
  end

  def test_all_discounts
    @checkout.scan("VOUCHER")
    @checkout.scan("TSHIRT")
    @checkout.scan("VOUCHER")
    @checkout.scan("VOUCHER")
    @checkout.scan("MUG")
    @checkout.scan("TSHIRT")
    @checkout.scan("TSHIRT")
    price = @checkout.total
    assert_equal "74.50€", price
  end
end
