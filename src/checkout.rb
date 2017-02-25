
class Checkout
  def initialize(pricing_rules=Array.new, discount_rate, threshold)
    @pricing_rules = pricing_rules
    @items = Array.new
    @discount_rate = discount_rate
    @threshold = threshold
  end

  def scan(item)
    @items << item
  end

  def discount_total
      if @total > @threshold
        @total - @total * @discount_rate
      else
      return @total
      end
    end

  def total
    @total = 0.0
    @pricing_rules.each do |pricing_rule|
      item_code = pricing_rule.item_code

      relevant_items = @items.select {|i| i.code == item_code}
      relevant_items.each{|i| @items.delete i}

      @total += pricing_rule.price_for relevant_items.count
    end
    @total += @items.inject(0) { |sum, n| sum + (n.unit_price) }
    discount_total
  end
  
    
end