class OrdersController < ApplicationController
  before_action :authenticate_user!

  def index
    @product = Product.find(params[:product_id])
    @purchase_address = PurchaseAddress.new
    if (current_user == @product.user) || @product.purchase_list.present?
      redirect_to root_path
    end
  end

  def new
    @purchase_address =PurchaseAddress.new
  end

  def create
    @product = Product.find(params[:product_id])
    @purchase_address = PurchaseAddress.new(purchase_address_params)
    if @purchase_address.valid?
      pay_item
      @purchase_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private
  def purchase_address_params
    params.require(:purchase_address).permit(:postal_code, :prefecture_id, :municipality, :address, :building_name, :phone_number).merge(token: params[:token], product_id: params[:product_id], user_id: current_user.id,)
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @product.price,
      card: purchase_address_params[:token],
      currency: 'jpy'
    )
  end
end
