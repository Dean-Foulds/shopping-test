require_relative '../src/item'
require_relative '../src/bulk_pricing_rule'

describe BulkPricingRule do
  context 'buy 2 or more Lavender Heart for special price' do
    let(:item_price) { 9.25 }
    let(:package_price) { 34.0 }
    let(:subject) {BulkPricingRule.new "Lavender Heart", item_price, 4, package_price}

    describe '#price_for' do
      it "calculates correct price for 4 items" do
        expect(subject.price_for 4).to eq package_price
      end
      it "calculates correct price for 1 item" do
        expect(subject.price_for 1).to eq item_price
      end
    end
  end
end