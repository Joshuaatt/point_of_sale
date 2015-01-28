require('spec_helper')

describe(Product) do
  it("validates presence of name and cost") do
    product = Product.new({:name => "", :cost => ""})
    expect(product.save()).to(eq(false))
  end
end
