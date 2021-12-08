# frozen_string_literal: true

require File.join(File.dirname(__FILE__), 'gilded_rose')
require 'rspec'

describe GildedRose do
  describe '#update_quality' do
    it 'does not change the name' do
      items = [Item.new('foo', 0, 0)]
      GildedRose.new(items).update_quality
      expect(items[0].name).to eq 'foo'
    end

    it 'substract from the quality 2 of a normal item' do
      item = Item.new('+5 Dexterity Vest', 0, 5)
      items = []
      items << item
      GildedRose.new(items).update_quality
      expect(items[0].quality).to eq(3)
    end
  end
end
