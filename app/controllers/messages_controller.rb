class MessagesController < ApplicationController
  include CurrentCart
  before_action :set_cart

  def create
    @message = Message.new(message_params)

    if @message.save
      flash[:success] = "Your message sent."
      redirect_to store_contact_path
    else
      render 'store/contact'
    end
  end

  private
    def message_params
      params.require(:message).permit(:name, :body, :sender)
    end
end
