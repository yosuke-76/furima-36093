class TagsController < ApplicationController
  def new
    @product_tag = ProductTag.new
  end

  def create
    @product_tag = ProductTag.new(tag_params)
    if @product_tag.valid?
      @product_tag.save
      redirect_to root_path
    else
      render :new
    end
  end
  
  private

  def tag_params
    params.require(:product_tag).permit(:product, :name, :image, :product_name, :product_text, :category_id, :product_status_id, :delivery_charge_id, :prefecture_id, :shipping_day_id, :price).merge(user_id: current_user.id)
  end
end
