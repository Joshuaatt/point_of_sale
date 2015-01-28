ENV['RACK_ENV'] = 'test'
require('sinatra')
require('rspec')
require('sinatra/activerecord')
require('product')
require('purchase')
require('pry')

RSpec.configure do |config|
  config.after(:each) do
    Product.all().each() do |product|
      product.destroy()
    end
    Purchase.all().each() do |purchase|
      purchase.destroy()
    end
  end
end
