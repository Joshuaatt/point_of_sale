ENV['RACK_ENV'] = 'test'
require('sinatra')
require('rspec')
require('sinatra/activerecord')
require('product')

RSpec.configure do |config|
  config.after(:each) do
    Product.all().each() do |product|
      product.destroy()
    end
  end
end
