require_relative '../src/item'
require_relative '../src/bulk_pricing_rule'
require_relative '../src/checkout'

describe Checkout do
  describe '#total' do
    it "calculates correct price for 1 item 001, 1 item 002 and 1 item 003 total to be £66.78 - with 10% discount" do
      items = Array.new
      items << Item.new( "001", 9.25 )
      items << Item.new( "002", 45.00 )
      items << Item.new( "003", 19.95 )
      offers = Array(BulkPricingRule.new("001", 9.25, 1, 9.25))
      offers = Array(BulkPricingRule.new("002", 45.00, 1, 45.00))
      offers = Array(BulkPricingRule.new("003", 19.95, 1, 19.95))
      checkout = Checkout.new( offers, 0.01, 60 )
      items.each do |i|
        checkout.scan i
      end
      expect(checkout.total).to be(( 9.25 + 45.00 + 19.95) - ( 9.25 + 45.00 + 19.95) * 0.01)
    end
  end
  
    describe '#total' do
    it "calculates correct price for 2 item 001, 1 item 003 total to be £36.95 - no 10% discount" do
      items = Array.new
      2.times do
        items << Item.new( "001", 9.25 )
      end  
        items << Item.new( "003", 19.95 )
        offers = Array(BulkPricingRule.new("001", 9.25, 2, 17.0) )
      checkout = Checkout.new(offers, 0.01, 60)
      items.each do |i|
        checkout.scan i
      end
      expect(checkout.total).to be( 8.50 + 19.95 + 8.50)
    end
  end

describe '#total' do
    it "calculates correct price for 2 item 001, 1 item 003 and 1 item 002 total to be £73.76 with 10% discount" do
      items = Array.new
      2.times do
        items << Item.new( "001", 9.25 )
      end  
        items << Item.new( "003", 19.95 )
        items << Item.new( "002", 45.00 )
        offers = Array(BulkPricingRule.new("001", 9.25, 2, 17.0) )
      checkout = Checkout.new(offers, 0.01, 60)
      items.each do |i|
        checkout.scan i
      end
      expect(checkout.total).to be(( 8.50 + 19.95 + 8.50 + 45.00) - ( 8.50 + 19.95 + 8.50 + 45.00) * 0.01)
    end
  end
end



