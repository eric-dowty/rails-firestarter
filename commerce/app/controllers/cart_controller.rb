class CartController < ApplicationController

  def index
    @cart
  end

  def update
    @cart.adjust(adjust_params)
    redirect_to cart_index_path
  end

  def create
    if Item.available?(cart_params[:item_id])
      @cart.add_to_cart(cart_params)
      session[:cart] = @cart.contents
      redirect_to items_path
    else
      flash[:errors] = 'Item is not available'
    end
  end

  private

  def cart_params
    params.require(:item).permit(:item_id, :quantity)
  end

  def adjust_params
    params.permit(:id, :adjust)
  end

end