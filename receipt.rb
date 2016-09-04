require './basket'

class Receipt
  attr_accessor :basket_array

  def initialize(filename)
    @basket_array = []
    scan_items(filename)
    self.print
  end

  def scan_items(filename)
    file = File.open(filename)
    file.each do |line|
      if (line.include?("===="))
        basket = Basket.new
        self.basket_array.push(basket)
      else
        word_array = line.chomp.split(" ")
        name = word_array[0]
        price = word_array[1].to_f
        exempt = word_array[2].to_bool
        import = word_array[3].to_bool
        item = Item.new(name,price,exempt,import)
        self.basket_array[-1].item_array << item
      end
    end
  end

  def print
    puts "\n"
    output = 0
    self.basket_array.each do |basket|
      output += 1
      puts "Output: " + output.to_s
      basket.item_array.each do |item|
        puts item.name + ": " + ('%.2f' % item.total_price)
      end
      puts "Sales Taxes: " + ('%.2f' % basket.sales_tax)
      puts "Total: " + ('%.2f' % basket.basket_price)
      puts "\n"
    end
  end

end


