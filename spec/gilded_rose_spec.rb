# require File.join(File.dirname(__FILE__), 'gilded_rose')
require 'rspec'
require 'gilded_rose'

describe GildedRose do

  describe "#update_quality" do
    it "does not change the name" do
      items = [Item.new("foo", 0, 0)]
      GildedRose.new(items).update_quality()
      expect(items[0].name).to eq "foo"
    end

    context "for a normal item" do
      it "if the sell_in value has not yet been reached, it lowers the quality by 1" do
        items = [Item.new("normal_item", 5, 5)]
        gilded_rose = GildedRose.new(items)
        gilded_rose.update_quality()
        expect(items[0].quality).to eq 4
      end

      it "decreases the sell_in value by 1" do
        items = [Item.new("normal_item", 5, 5)]
        gilded_rose = GildedRose.new(items)
        gilded_rose.update_quality()
        expect(items[0].sell_in).to eq 4
      end
    end
  end

end
