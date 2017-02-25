class Item
  attr_accessor :code, :unit_price
  def initialize(code, unit_price)
    @code = code
    @unit_price = unit_price
  end
end