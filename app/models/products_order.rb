class ProductsOrder < ActiveRecord::Base
  belongs_to :order
  belongs_to :product
  belongs_to :color
  belongs_to :size
end
