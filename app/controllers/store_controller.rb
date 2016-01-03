class StoreController < ApplicationController
  include CurrentCart
  before_action :set_cart

  def index
    @categories = Category.all
    @carousel_products = CarouselProduct.all
    @slider_product = SliderProduct.all
    @products = BestSeller.find_product(6)
  end

  def product
    @product = Product.find(params[:id])
    @categories = Category.all
    @colors = Color.all
    @sizes = Size.all
    @products_order = ProductsOrder.new
    @best_sellers = BestSeller.find_product(10)
  end
  
  def cart
   @cart = Order.find(params[:id])
  end

  def search_products
    @products = Product.where(category_id: params[:id]).order(:id).page(params[:page]).per(6)

    @category = Category.find(params[:id])
    @category_id = "category_#{params[:id]}"

    respond_to do |format|
      format.html
      format.js {}
    end
  end

  def search_brand_products
    @products = Product.where(brand_id: params[:id]).order(:id).page(params[:page]).per(6)
    @brand = Brand.find(params[:id])

    respond_to do |format|
      format.html
      format.js {}
    end
  end

  def search
    @products = Product.search(params[:search_text], params[:page])

    respond_to do |format|
      format.html
      format.js {}
    end
  end

  def contact
    @categories = Category.all
    @message = Message.new
  end

  def services
    @best_sellers = BestSeller.find_product(10)
  end
end
