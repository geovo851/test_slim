module CurrentCart
  extend ActiveSupport::Concern

  private

    def set_cart
      @cart = Order.find_by(id: session[:cart_id], order: false)
      if @cart
        @sum_in_cart = @cart.total_sum
      else
        @cart = Order.create
        session[:cart_id] = @cart.id
        @sum_in_cart = 0
      end
    end
end