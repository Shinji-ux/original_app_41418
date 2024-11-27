class ItemsController < ApplicationController
  def new
    @user = User.find(params[:user_id])
    @item = Item.new
  end

  def create
    @user = User.find(params[:user_id])
    @item = @user.items.build(item_params)
    if @item.save
      redirect_to new_user_item_path(@user)
    else
      render :new
    end
  end

  private
  def item_params
    params.require(:item).permit(:item_name, :price)
  end
end
