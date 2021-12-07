class GildedRose

  def initialize(items)
    @items = items
  end

  def name_checker(item)
    bonus = 0
    if item.name != "Aged Brie" and item.name != "Backstage passes to a TAFKAL80ETC concert" and item.name != "Sulfuras, Hand of Ragnaros"
      if item.quality > 0
        if item.name != "Conjured Mana Cake"
          bonus = 1 
        else
          bonus = 2 
        end
        downgrade_quality(item, bonus + bonus_sell_in(item))
      end
    elsif item.name != "Sulfuras, Hand of Ragnaros"
      if item.quality < 50
        if item.name == "Backstage passes to a TAFKAL80ETC concert"
          if item.sell_in < 0
            item.quality = 0
            bonus = 0
          else
            bonus = backstage_bonus(item)
          end
        elsif item.name == "Aged Brie"
          bonus = 1
        end
        upgrade_quality(item,bonus)
      end
    end
  end

    # if backstage 
    # 1..1dias bonus = x
    #if aged brie 
    # |...| bonus x
    #upgrade_quality(bonus)
    #if
    #
    #

  def upgrade_quality(item, bonus)
    item.quality = item.quality + bonus
  end

  def downgrade_quality(item, bonus)
    item.quality = item.quality - bonus
  end

  def bonus_sell_in(item)
    if item.sell_in < 0
      1
    elsif item.sell_in < 0 && item.name == "Conjured Mana Cake"
      2
    else
      0
    end
  end
  
  def backstage_bonus(item)
    bonus = 0
    if item.sell_in < 11 && item.sell_in > 6
      bonus += 2
    elsif item.sell_in < 6
      bonus +=3
    end
    bonus
  end

  def update_quality()
    @items.each do |item| 
      item.sell_in = item.sell_in - 1
      name_checker(item)
    end
  end

  # def update_quality()
  #   @items.each do |item|
  #     if item.name != "Aged Brie" and item.name != "Backstage passes to a TAFKAL80ETC concert"
  #       if item.quality > 0
  #         if item.name != "Sulfuras, Hand of Ragnaros"
  #           if item.name != "Conjured Mana Cake"
  #             item.quality = item.quality - 1
  #           else
  #             item.quality = item.quality - 2
  #           end
  #         end
  #       end
  #     else
  #       if item.quality < 50
  #         item.quality = item.quality + 1
  #         if item.name == "Backstage passes to a TAFKAL80ETC concert"
  #           if item.sell_in < 11
  #             if item.quality < 50
  #               item.quality = item.quality + 1
  #             end
  #           end
  #           if item.sell_in < 6
  #             if item.quality < 50
  #               item.quality = item.quality + 1
  #             end
  #           end
  #           if item.sell_in == 0
  #             item.quality = 0
  #           end
  #         end
  #       end
  #     end
  #     if item.name != "Sulfuras, Hand of Ragnaros"
  #       item.sell_in = item.sell_in - 1
  #     end
  #     if item.name == "Aged Brie"
  #       if item.quality < 50
  #         item.quality = item.quality + 1
  #       end
  #     end
  #     if item.sell_in < 0
  #       if item.name != "Aged Brie"
  #         if item.name != "Backstage passes to a TAFKAL80ETC concert"
  #           if item.quality > 0
  #             if item.name != "Sulfuras, Hand of Ragnaros"
  #               if item.name != "Conjured Mana Cake"
  #                 item.quality = item.quality - 1
  #               else
  #                 item.quality = item.quality - 2
  #               end 
  #             end
  #           end
  #         else
  #           item.quality = item.quality - item.quality
  #         end
  #       else
  #         if item.quality < 50
  #           item.quality = item.quality + 1
  #         end
  #       end
  #     end
  #   end
  # end
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
