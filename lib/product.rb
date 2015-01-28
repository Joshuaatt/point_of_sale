class Product < ActiveRecord::Base
  belongs_to(:purchase)
  validates(:name, :cost, :presence => true)
end
