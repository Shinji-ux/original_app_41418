class ItemsController < ApplicationController
  # def filter_by_category
  #   @items = Item.where(category_id: params[:category_id])
  #   respond_to do |format|
  #     format.js
  #   end
  # end
  def index
    @items = Item.all
  end
  
  def new
    @categories = Category.all
    @item = Item.new
  end

  def create
    @categories = Category.all
    @item = Item.new(item_params)
    if @item.save
      redirect_to new_item_path
    else
      render :new
    end
  end

  def edit
    @item = Item.find(params[:id])
    @categories = Category.all
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to items_path
    else
      render :edit
    end
  end

  def destroy
    item = Item.find(params[:id])
    item.destroy
    redirect_to items_path
  end

  private
  def item_params
    params.require(:item).permit(:item_name, :unit, :price, :category_id)
  end
end
