require './item'
require './helper'

class Basket
  attr_reader :item_array

  def initialize
    @item_array = []
  end

  def sales_tax
    total_tax = 0
    self.item_array.each do |item|
      total_tax += item.rounded_tax
    end
    total_tax
  end

  def total_shelf
    total_price = 0
    self.item_array.each do |item|
      total_price += item.price
    end
    return total_price
  end

  def basket_price
   self.total_shelf + self.sales_tax
  end

end



