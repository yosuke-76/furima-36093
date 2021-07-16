class ProductsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update]
  before_action :set_product, only: [:show, :edit, :update]
  before_action :user_product, only: [:edit, :update]
  def index
    @products = Product.order('created_at DESC')
  end
  def new
    @product = Product.new
  end
  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to root_path
    else
      render :new
    end
  end
  def show
  end
  def edit
  end
  def update
    if @product.update(product_params)
      redirect_to product_path
    else
      render :edit
    end
  end

  private
  def product_params
    params.require(:product).permit(:image, :product_name, :product_text, :category_id, :product_status_id, :delivery_charge_id, :prefecture_id, :shipping_day_id, :price).merge(user_id: current_user.id)
  end
  def set_product
    @product = Product.find(params[:id])
  end
  def user_product
    unless user_signed_in? && current_user.id == @product.user_id
      redirect_to root_path
    end
  end
end