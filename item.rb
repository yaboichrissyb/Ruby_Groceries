require './helper'

class Item
  attr_reader :name, :price, :exempt, :import

  def initialize(name, price, exempt, import)
    @name = name.split_underscore
    @price = price
    @exempt = exempt
    @import = import
  end

  def tax_rate
    tax = 0.1
    tax -= 0.1 if self.exempt
    tax += 0.05 if self.import
    tax.round(2)
  end

  def item_tax
    (self.price * self.tax_rate).round(2)
  end

  def rounded_tax
    float_total = ('%.2f' % self.item_tax)
    dig_array = float_total.split("")
    last = dig_array[-1].to_i
    if last > 5
      dig_array[-1] = "0"
      dig_array[-2] = (dig_array[-2].to_i + 1).to_s
    elsif last != 0
      dig_array[-1] = 5
    end
    return dig_array.join("").to_f
  end

  def total_price
    self.price + self.rounded_tax
  end

end



