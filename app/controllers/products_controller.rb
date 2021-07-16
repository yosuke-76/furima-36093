class ProductsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit]
  def index
    @products = Product.order('created_at DESC')
  end
  def new
    @product = Product.new
  end
  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to products_path
    else
      render :new
    end
  end
  def show
    @product = Product.find(params[:id])
  end
  def edit
    @product = Product.find(params[:id])
    unless user_signed_in? && current_user.id == @product.user_id
      redirect_to "/"
    end
  end
  def update
    @product = Product.find(params[:id])
    @product.update(product_params)
    if @product.save
      redirect_to product_path
    else
      render :edit
    end
  end

  private
  def product_params
    params.require(:product).permit(:image, :product_name, :product_text, :category_id, :product_status_id, :delivery_charge_id, :prefecture_id, :shipping_day_id, :price).merge(user_id: current_user.id)
  end
end