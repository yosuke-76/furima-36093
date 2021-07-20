class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_order, only: [:index, :create]
  before_action :move_to_root, only: :index
  before_action :purchase_address_new, only: [:index, :new]

  def index
  end

  def new
  end

  def create
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
  def set_order
    @product = Product.find(params[:product_id])
  end
  def move_to_root
    if (current_user == @product.user) || @product.purchase_list.present?
      redirect_to root_path
    end
  end
  def purchase_address_new
    @purchase_address = PurchaseAddress.new
  end
end
