require("sinatra/activerecord")
require('sinatra')
require('sinatra/reloader')
also_reload("lib/**/*.rb")
require("./lib/product")
require("./lib/purchase")
require('pry')

get("/") do
  @products = Product.all()
  erb(:index)
end

# get("/products/:id") do
#   @products = Product.find(params["id"].to_i())
#   redirect('/')
# end


post("/products") do
  name = params.fetch("name")
  cost = params.fetch("cost").to_i()
  purchase_id = params.fetch("purchase_id").to_i()
  @product = Product.new({:name => name, :cost => cost})
  @product.save()
  @purchase = Purchase.find(purchase_id)
  erb(:success)
end

patch("/products/:id") do
  name = params.fetch("name")
  cost = params.fetch("cost").to_i()
  @product = Product.find(params.fetch("id").to_i())
  @product.update({:name => name, :cost => cost})
  @products = Product.all()
  erb(:index)
end

get('/products/:id/edit') do
  @product = Product.find(params.fetch("id").to_i())
  erb(:product_edit)
end

delete("/products/:id") do
  @product = Product.find(params.fetch("id").to_i())
  @product.delete()
  @products = Product.all
  erb(:index)
end
#------------------------------------

post("/purchase") do
binding.pry
  product_id = params.fetch("product_ids")
  datetime = params['datetime']
  @purchase = Purchase.new({:product_id => product_id, :datetime => datetime})
  @purchase.save()
  @product = Product.find('id')
  @purchases = Purchase.all()
  erb(:purchase)
end

# get('/purchase/:id') do
#   @purchase = Purchase.find(params.fetch("id").to_i())
#   erb(:purchase)
# end

get('/purchase') do
  @purchase = Purchase.all()
  erb(:purchase)
end
