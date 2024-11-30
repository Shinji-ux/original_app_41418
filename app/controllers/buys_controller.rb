class BuysController < ApplicationController

  def new
    @supplier = Supplier.find(params[:supplier_id])
    @buy = Buy.new
    @buy.buy_items.build
    @items = Item.all
    @categories = Category.all
  end

  def create
    @supplier = Supplier.find(params[:supplier_id])
    @buy = @supplier.buys.new(buy_params)
    if @buy.save
      redirect_to root_path, notice: 'Buy was successfully created.'
    else
      @items = Item.all
      render :new
    end
  end

  private 
  def buy_params
    params.require(:buy).permit(:transaction_date, :total_price, buy_items_attributes: [:item_id, :quantity, :category_id])
  end

end
