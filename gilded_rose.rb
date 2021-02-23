# Create variables for names to keep it DRY
AGED_BRIE = 'Aged Brie'
PASSES = 'Backstage passes to a TAFKAL80ETC concert'
SULFURAS = 'Sulfuras, Hand of Ragnaros'
CONJURED = 'Conjured Mana Cake'

class UpdateItem
  # sell_in attribute is not going to be read
  # outside the class so no need for a reader
  attr_reader :item, :quality_value

  def initialize(item, quality_value)
    @item = item
    @quality_value = quality_value
  end

  def add_quality
    # Check if quality meets the requirements
    # it should be more than 0 but less than 50
    if item.quality > 0 && item.quality < 50
      # Add the appropriate value
      # stated in the case-when statement
      item.quality += quality_value
    end
  end

  def update
    # Counter for days passing
    # applicable for all items but sulfuras
    item.sell_in -= 1

    # Add appropriate value with #add_quality
    add_quality
    add_quality if item.sell_in < 0
  end
end

def update_quality(items)
  # Iterate through items and check the name
  # of each item instance
  items.each do |item|
    case item.name
    # SULFURAS will not change
    when SULFURAS
    # AGED_BRIE will increase its quality_value by 1
    # with passing time
    when AGED_BRIE
      UpdateItem.new(item, 1).update
    # PASSES will have multiple options for quality_value
    when PASSES
      # if the sell date is <= 0, drop the quality to 0
      if item.sell_in <= 0
        UpdateItem.new(item, -item.quality).update
      # if the sell date is < 6, increase by 3
      elsif item.sell_in < 6
        UpdateItem.new(item, 3).update
      # if the sell date is < 11, increase by 2
      elsif item.sell_in < 11
        UpdateItem.new(item, 2).update
      # else (>11), quality increases by 1
      else
        UpdateItem.new(item, 1).update
      end
    # CONJURED will decrease quality twice as quickly as normal items
    when CONJURED
      UpdateItem.new(item, -2).update
    # any other case decreases quality by 1 each day
    else
      UpdateItem.new(item, -1).update
    end
  end
end

# DO NOT CHANGE THINGS BELOW -----------------------------------------

Item = Struct.new(:name, :sell_in, :quality)

# We use the setup in the spec rather than the following for testing.
#
# Items = [
#   Item.new("+5 Dexterity Vest", 10, 20),
#   Item.new("Aged Brie", 2, 0),
#   Item.new("Elixir of the Mongoose", 5, 7),
#   Item.new("Sulfuras, Hand of Ragnaros", 0, 80),
#   Item.new("Backstage passes to a TAFKAL80ETC concert", 15, 20),
#   Item.new("Conjured Mana Cake", 3, 6),
# ]
