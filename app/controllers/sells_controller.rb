class SellsController < ApplicationController

  def new
    @customer = Customer.find(params[:customer_id])
    @sell = Sell.new
    @sell.sell_items.build
    @items = Item.all
    @categories = Category.all
  end

  def create
    @customer = Customer.find(params[:supplier_id])
    @sell = @Customer.sells.new(sell_params)
    @categories = Category.all
    if @sell.save
      redirect_to root_path, notice: 'Sell was successfully created.'
    else
      @items = Item.all
      @categories = Category.all
      render :new
    end
  end

  def order_index
  end

  private 
  def sell_params
    params.require(:sell).permit(:transaction_date, :total_price, sell_items_attributes: [:id, :item_price, :quantity, :category_id, :item_id, :destroy])
  end
end
