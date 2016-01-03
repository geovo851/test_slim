class BestSeller < ActiveRecord::Base
  belongs_to :product

  def self.add_products products_orders
    products_orders.each do |p|
      create(product_id: p.product_id, quantity: p.quantity)
    end
  end

  def self.find_product count
    select_field = 'products.name AS product_name, products.photo AS product_photo, products.price AS product_price, best_sellers.product_id AS product_max, sum(best_sellers.quantity) AS product_quantity'
    joins(:product).select(select_field).group("product_max, product_name, product_price, product_photo").order("sum(best_sellers.quantity) DESC").first(count)
  end
end
