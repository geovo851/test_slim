class Order < ActiveRecord::Base
  belongs_to :payment
  has_many :products_orders, dependent: :destroy
  has_many :products, through: :products_orders

  validates :payment, :delivary_adress, :phone_number, presence: true, if: :order
end
