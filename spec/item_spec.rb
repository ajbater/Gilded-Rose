require 'rspec'
require 'item'

describe Item do
  it "the quality of an item can never go below 0" do
    items = [Item.new("Normal Item", 5, 5)]
    gilded_rose = GildedRose.new(items)
    6.times { gilded_rose.update_quality() }
    expect(items[0].quality).to eq 0
  end
end
