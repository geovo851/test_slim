class ProductsOrdersController < ApplicationController
  include CurrentCart
  before_action :set_cart

  def new
    @products_order = ProductsOrder.new
    @products = Product.all
    @order_id = params[:order_id]
  end

  def create
    @cart.total_sum += params[:price].to_f

    @products_orders = @cart.products_orders.find_by(product_id: params[:product_id],
                              color_id: params[:products_order][:color_id],
                              size_id: params[:products_order][:size_id])

    if @products_orders
      @products_orders.quantity += 1
    else
      @products_orders = @cart.products_orders.build(product_id: params[:product_id],
                                   quantity: 1, price: params[:price],
                                   color_id: params[:products_order][:color_id],
                                   size_id: params[:products_order][:size_id])
    end

    if @products_orders.save && @cart.save
      flash[:success] = "Product added to cart."
      redirect_to store_product_path(params[:product_id])
    else
      flash[:error] = "Could not add to cart."
      render :back
    end
  end

  def edit
    @products_order = ProductsOrder.find(params[:id])
    @products = Product.all
    @order_id = params[:order_id]
  end

  def update
    product = Product.find_by(id: params[:products_order][:product_id])
    @order = Order.find(params[:order_id])

    @products_order = @order.products_orders.find_by(id: params[:id])
    
    @products_order.quantity = params[:products_order][:quantity].to_f

    @order.total_sum -= @products_order.quantity * @products_order.price
    
    @products_order.price = product.price
    @products_order.quantity = params[:products_order][:quantity].to_f
    @products_order.product_id = product.id
    
    @order.total_sum += @products_order.price * @products_order.quantity

    if @products_order.save && @order.save
      redirect_to root_path
    else
      flash[:error] = "Could not edit to order."
      render 'edit'
    end
  end

  def update_quantity
    products_order = ProductsOrder.find_by(id: params[:id])
    products_order.quantity = params[:quantity].to_f
    products_order.order.total_sum = params[:total_sum]
    products_order.order.save
    products_order.save
  end

  def destroy
    if params[:order_id]
      @order = Order.find(params[:order_id])
      @order.total_sum ||= 0
      
      @products_order = @order.products_orders.find(params[:id])
      @order.total_sum -= (@products_order.price * @products_order.quantity)
      @order.save
      
      @products_order.destroy

      redirect_to order_path(@order.id)
    else
      @products_order = @cart.products_orders.find(params[:id])
      @cart.total_sum -= (@products_order.price * @products_order.quantity)
      @cart.save
      
      @products_order.destroy

      redirect_to root_path
    end
  end
end

