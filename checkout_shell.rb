require File.expand_path("../lib/checkout", __FILE__)

class CheckoutShell
  def run(input)
    @checkout = Checkout.new(
      prices: { voucher: 500, tshirt: 2000, mug: 750 },
      discounts: { voucher: "2-for-1", tshirt: "bulk_discount" }
    )

    input.each do |item|
      @checkout.scan(item)
    end

    @checkout.total
  end
end

checkout_shell = CheckoutShell.new
puts "Total: #{checkout_shell.run(ARGV)}"
