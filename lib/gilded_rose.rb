class GildedRose

  def initialize(items)
    @items = items
  end

  MAXIMUM_QUALITY = 50
  MINIMUM_QUALITY = 0

  def normal_item?(item)
    (item.name != "Aged Brie" && item.name != "Backstage passes to a TAFKAL80ETC concert") && item.name != "Sulfuras, Hand of Ragnaros"
  end

  def aged_brie?(item)
    item.name == "Aged Brie"
  end

  def backstage_passes?(item)
    item.name == "Backstage passes to a TAFKAL80ETC concert"
  end

  def sulfuras?(item)
    item.name == "Sulfuras, Hand of Ragnaros"
  end

  def decrease_sell_in_value(item)
    item.sell_in -= 1
  end

  def decrease_quality(item)
    item.quality -= 1
  end

  def increase_quality(item)
    item.quality += 1
  end

  def update_normal(item)
    decrease_quality(item)
    decrease_sell_in_value(item)
  end

  def update_brie(item)
    increase_quality(item)
    decrease_sell_in_value(item)
  end

  def update_backstage_passes(item)
    if item.sell_in <= 5 && item.quality < MAXIMUM_QUALITY
      3.times { decrease_quality(item) }
    elsif item.sell_in <= 10 && item.quality < MAXIMUM_QUALITY
      2.times { decrease_quality(item) }
    else
      decrease_quality(item)
    end
    decrease_sell_in_value(item)
  end

  def update_quality()

  end

#   def update_quality()
#     @items.each do |item|
#       if normal_item?(item)
#         if item.quality > MINIMUM_QUALITY
#           if !sulfuras?(item)
#             item.quality = item.quality - 1
#           end
#         end
#       else
#         if item.quality < MAXIMUM_QUALITY
#           item.quality = item.quality + 1
#           if backstage_passes?(item)
#             if item.sell_in < 11
#               if item.quality < MAXIMUM_QUALITY
#                 item.quality = item.quality + 1
#               end
#             end
#             if item.sell_in < 6
#               if item.quality < MAXIMUM_QUALITY
#                 item.quality = item.quality + 1
#               end
#             end
#           end
#         end
#       end
#       if !sulfuras?(item)
#         decrease_sell_in_value(item)
#       end
#       if item.sell_in < 0
#         if !aged_brie?(item)
#           if !backstage_passes?(item)
#             if item.quality > MINIMUM_QUALITY
#               if !sulfuras?(item)
#                 item.quality = item.quality - 1
#               end
#             end
#           else
#             item.quality = item.quality - item.quality
#           end
#         else
#           if item.quality < MAXIMUM_QUALITY
#             item.quality = item.quality + 1
#           end
#         end
#       end
#     end
#   end
end

class Item
  attr_accessor :name, :sell_in, :quality

  def initialize(name, sell_in, quality)
    @name = name
    @sell_in = sell_in
    @quality = quality
  end

  def to_s()
    "#{@name}, #{@sell_in}, #{@quality}"
  end
end
