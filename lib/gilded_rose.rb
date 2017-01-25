class GildedRose

  def initialize(items)
    @items = items
  end

  MAXIMUM_QUALITY = 50
  MINIMUM_QUALITY = 0

  def update_quality()
    @items.each do |item|
      update_brie(item) if aged_brie?(item)
      update_backstage_passes(item) if backstage_passes?(item)
      update_conjured(item) if conjured?(item)
      update_normal_item(item) if normal_item?(item)
    end
  end

  private

  def normal_item?(item)
    (!aged_brie?(item) && !backstage_passes?(item)) && (!sulfuras?(item) && !conjured?(item))
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

  def conjured?(item)
    item.name == "Conjured"
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

  def decrease_quality_normal(item)
    decrease_quality(item) if item.sell_in >= 0 && item.quality > MINIMUM_QUALITY
  end

  def decrease_quality_double(item)
    2.times { decrease_quality(item) } if item.quality > MINIMUM_QUALITY
  end

  def update_normal_item(item)
    decrease_quality_normal(item)
    decrease_quality_double(item) if item.sell_in < 0
    decrease_sell_in_value(item)
  end

  def update_brie(item)
    increase_quality(item) if item.quality < MAXIMUM_QUALITY
    decrease_sell_in_value(item)
  end

  def backstage_quality_normal_increase(item)
    increase_quality(item) if item.sell_in > 10 && item.quality < MAXIMUM_QUALITY
  end

  def backstage_quality_double_increase(item)
    2.times { increase_quality(item) } if item.sell_in.between?(6, 10) && item.quality < MAXIMUM_QUALITY
  end

  def backstage_quality_triple_increase(item)
    3.times { increase_quality(item) } if item.sell_in <=5 && item.quality < MAXIMUM_QUALITY
  end

  def update_backstage_passes(item)
    backstage_quality_normal_increase(item)
    backstage_quality_double_increase(item)
    backstage_quality_triple_increase(item)
    decrease_sell_in_value(item)
    item.quality = 0 if item.sell_in < 0
  end

  def update_conjured(item)
    decrease_quality_double(item)
    decrease_sell_in_value(item)
  end

end
