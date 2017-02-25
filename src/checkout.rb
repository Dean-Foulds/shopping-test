
class Checkout
  def initialize(pricing_rules=Array.new)
    @pricing_rules = pricing_rules
    @items = Array.new
  end

  def scan(item)
    @items << item
  end

  def total
    total = 0.0
    @pricing_rules.each do |pricing_rule|
      item_code = pricing_rule.item_code

      relevant_items = @items.select {|i| i.code == item_code}
      relevant_items.each{|i| @items.delete i}

      total += pricing_rule.price_for relevant_items.count
    end
    total += @items.inject(0) { |sum, n| sum + (n.unit_price) }
    if total > 60
      total - total * 0.01
    else
     return total
    end
  end
end