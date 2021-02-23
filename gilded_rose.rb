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
      # Add the appropriate value
  end

  def update
    # Counter for days passing

    # Add appropriate value with #add_quality

  end
end

def update_quality(items)
  items.each do |item|

    # QUALITY PART
    if item.name != AGED_BRIE && item.name != PASSES
      if item.quality > 0
        if item.name != SULFURAS
          item.quality -= 1
        end
      end
    else
      if item.quality < 50
        item.quality += 1
        if item.name == PASSES
          if item.sell_in < 11
            if item.quality < 50
              item.quality += 1
            end
          end
          if item.sell_in < 6
            if item.quality < 50
              item.quality += 1
            end
          end
        end
      end
    end

    # COUNTER PART
    if item.name != SULFURAS
      item.sell_in -= 1
    end
    if item.sell_in < 0
      if item.name != AGED_BRIE
        if item.name != PASSES
          if item.quality > 0
            if item.name != SULFURAS
              item.quality -= 1
            end
          end
        else
          item.quality = item.quality - item.quality
        end
      else
        if item.quality < 50
          item.quality += 1
        end
      end
    end
  end

  # TO BE COMBINED IN ONE CASE STATEMENT
  # using the UpdateItem class
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

