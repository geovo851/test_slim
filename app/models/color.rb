class Color < ActiveRecord::Base
  has_many :products_orders
end
