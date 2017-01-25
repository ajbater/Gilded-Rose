require 'rspec'
require 'gilded_rose'

describe GildedRose do

  describe "#update_quality" do
    it "does not change the name" do
      items = [Item.new("Normal Item", 0, 0)]
      GildedRose.new(items).update_quality()
      expect(items[0].name).to eq "Normal Item"
    end

    context "for a normal item" do
      it "if the sell_in value has not yet been reached, it lowers the quality by 1" do
        items = [Item.new("Normal Item", 5, 10)]
        gilded_rose = GildedRose.new(items)
        gilded_rose.update_quality()
        expect(items[0].quality).to eq 9
      end

      it "decreases the sell_in value by 1" do
        items = [Item.new("Normal Item", 5, 10)]
        gilded_rose = GildedRose.new(items)
        gilded_rose.update_quality()
        expect(items[0].sell_in).to eq 4
      end

      it "decreases the quality by 2 after the sell_in value has been reached" do
        items = [Item.new("Normal Item", 5, 10)]
        gilded_rose = GildedRose.new(items)
        6.times { gilded_rose.update_quality() }
        gilded_rose.update_quality
        expect(expect(items[0].quality).to eq 2)
      end
    end

    context "for Aged Brie" do
      it "it will increase the quality as the sell_in date approaches" do
        items = [Item.new("Aged Brie", 5, 10)]
        gilded_rose = GildedRose.new(items)
        gilded_rose.update_quality()
        expect(items[0].quality).to eq 11
      end

      it "it cannot increase the quality of Aged Brie to more than 50" do
        items = [Item.new("Aged Brie", 5, 50)]
        gilded_rose = GildedRose.new(items)
        gilded_rose.update_quality()
        expect(items[0].quality).to eq 50
      end
    end

    context "for Sulfuras" do
      it "it will not change the quality" do
        items = [Item.new("Sulfuras, Hand of Ragnaros", 5, 80)]
        gilded_rose = GildedRose.new(items)
        gilded_rose.update_quality()
        expect(items[0].quality).to eq 80
      end

      it "it will not change the sell in value" do
        items = [Item.new("Sulfuras, Hand of Ragnaros", 5, 80)]
        gilded_rose = GildedRose.new(items)
        gilded_rose.update_quality()
        expect(items[0].sell_in).to eq 5
      end
    end

    context "for Backstage Passes" do
      it "it increases the quality by 1 as the sell_in value approaches" do
        items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 15, 1)]
        gilded_rose = GildedRose.new(items)
        gilded_rose.update_quality()
        expect(items[0].quality).to eq 2
      end

      it "it increases the quality by 2 when there are 10 days or left until sell_in value" do
        items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 10, 1)]
        gilded_rose = GildedRose.new(items)
        gilded_rose.update_quality()
        expect(items[0].quality).to eq 3
      end

      it "it increases the quality by 3 when there are 5 days or left until sell_in value" do
        items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 5, 1)]
        gilded_rose = GildedRose.new(items)
        gilded_rose.update_quality()
        expect(items[0].quality).to eq 4
      end

      it "it cannot increase the quality of Backstage Passes to more than 50" do
        items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 15, 50)]
        gilded_rose = GildedRose.new(items)
        gilded_rose.update_quality()
        expect(items[0].quality).to eq 50
      end

      it "it drops quality to zero when the sell_in value is below 0" do
        items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 0, 5)]
        gilded_rose = GildedRose.new(items)
        gilded_rose.update_quality()
        expect(items[0].quality).to eq 0
      end
    end

    context "for Conjured" do
      it "degrades the quality of these items twice as fast" do
        items = [Item.new("Conjured", 5, 5)]
        gilded_rose = GildedRose.new(items)
        gilded_rose.update_quality()
        expect(items[0].quality).to eq 3
      end
    end
  end

end
