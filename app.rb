require("sinatra/activerecord")
require('sinatra')
require('sinatra/reloader')
also_reload("lib/**/*.rb")
require("./lib/product")

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
  @product = Product.new({:name => name, :cost => cost})
  @product.save()
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
