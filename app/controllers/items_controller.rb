class ItemsController < ApplicationController

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

  def details
    @item = Item.find(params[:id])
    render json: { unit: @item.unit, price: @item.price }
  end

  def search
    @items = Item.all
  end

  def buy_receipt
    @item_id = params[:item_id]
    @item = Item.find(@item_id)
    @start_date = params[:start_date]
    @end_date = params[:end_date]
    @buy_receipts = Buy.joins(:buy_items)
                    .where(buy_items: { item_id: @item_id })
                    .where("transaction_date >= ?", @start_date)
                    .where("transaction_date <= ?", @end_date)
                    .order("buys.transaction_date ASC")
                    .distinct
  end

  def sell_receipt
    @item_id = params[:item_id]
    @item = Item.find(@item_id)
    @start_date = params[:start_date]
    @end_date = params[:end_date]
    @sell_receipts = Sell.joins(:sell_items)
                    .where(sell_items: { item_id: @item_id })
                    .where("transaction_date >= ?", @start_date)
                    .where("transaction_date <= ?", @end_date)
                    .order("sells.transaction_date ASC")
                    .distinct
  end

  private
  def item_params
    params.require(:item).permit(:item_name, :unit, :price, :category_id).merge(user_id: current_user.id)
  end
end
