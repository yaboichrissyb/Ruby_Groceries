require_relative 'item'
require_relative 'basket'
require_relative 'receipt'

# =======================
describe "item" do
  let (:perfume) { Item.new("perfume", 47.5, false, true) }
  it "creates a new instance of the Item class" do
    expect(perfume.class).to eq(Item)
  end

  it "has a total tax rate of 0.15" do
    expect(perfume.tax_rate).to eq(0.15)
  end

  it "has a total tax payment of 7.15" do
    expect(perfume.rounded_tax).to eq(7.15)
  end

  it "total tax payments is rounded to two decimals" do
    expect(perfume.rounded_tax.to_s.split("").length).to eq(4)
  end

  it "has a total price equal to 54.65" do
    expect(perfume.total_price).to eq(54.65)
  end

  let (:bar) { Item.new("1_imported_chocolates", 11.25, true, true) }
  it "has a tax rate equal to 0.05" do
    expect(bar.tax_rate).to eq(0.05)
  end

  it "has a string for a name separated at underscore" do
    expect(bar.name).to eq("1 imported chocolates")
  end

  it "has readable attributes" do
    expect(bar.exempt).to eq(true)
    expect(bar.import).to eq(true)
    expect(bar.price).to eq(11.25)
  end
end

# ================================
describe "item" do
  let (:perfume) { Item.new("perfume", 47.5, false, true) }
  it "creates a new instance of the Item class" do
    expect(perfume.class).to eq(Item)
  end
end
