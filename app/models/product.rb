class Product < ActiveRecord::Base
  belongs_to :category
  belongs_to :brand
  has_many :best_sellers
  has_many :products_orders
  has_many :orders, through: :products_orders
  has_many :photos, dependent: :destroy
  # mount_uploader :photo, ImageUploader

  validates :name, :category_id, presence: true
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0.001 }

  def self.search(query, page)
    where("name LIKE :query", {query: "%#{query}%"}).order(:id).page(page).per(6)
  end
end
