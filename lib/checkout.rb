class Checkout
  def initialize(pricing_rules)
    @prices = pricing_rules[:prices]
    @discounts = pricing_rules[:discounts]
    @items = {}
  end

  def scan(item)
    item_standarized = item.downcase.to_sym
    if @items.key?(item_standarized)
      @items[item_standarized] += 1
    else
      @items[item_standarized] = 1
    end
  end

  def total
    total = @items.reduce(0) do |sum, (item_type, number)|
      sum + process_item_type(item_type, number)
    end

    "#{total}€".insert(-4, ".")
  end

  private

  def process_item_type(item_type, number)
    @prices[item_type] * number - apply_discounts(item_type, number)
  end

  def apply_discounts(item_type, number)
    apply_2_for_1(item_type, number) + apply_bulk_discount(item_type, number)
  end

  def apply_2_for_1(item_type, number)
    if @discounts[item_type] == "2-for-1"
      @prices[item_type] * (number / 2)
    else
      0
    end
  end

  def apply_bulk_discount(item_type, number)
    if @discounts[item_type] == "bulk_discount" && number >= 3
      100 * number
    else
      0
    end
  end
end
