class OrdersController < ApplicationController

  def show
    @order_report = Order.find(params[:id]).report
  end

  def create
    order = Order.generate(current_user)

    if order.save
      order.add_items(session[:cart])
      session[:cart] = {}
      redirect_to order_path(order)
    else
      flash[:errors] = order.errors.full_messages.join(',')
      redirect_to cart_index_path
    end
  end

end