class DeliveriesController < ApplicationController
  include CurrentCart
  before_action :set_cart

  def edit
    @payments = Payment.all
  end

  def update
    @cart.order = true
    @cart.status = 'expect'
    if @cart.update(orders_params)
      message = "Your order is accepted. The manager will call you. Your order №#{@cart.id}"
      flash[:success] = message
      BestSeller.add_products(@cart.products_orders)
      set_cart

      redirect_to root_path
    else
      flash[:error] = "The order is not accepted."
      @payments = Payment.all

      render 'edit'
    end
  end

  private
    def orders_params
      params.require(:order).permit(:payment_id, :delivary_adress, :phone_number)
    end
end
