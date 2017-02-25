require_relative '../src/item'

describe Item do
  it 'has a code and a unit price' do
    item = Item.new('001', 9.25)
    expect(item.unit_price).to eq 9.25
    expect(item.code).to eq '001'
  end
end