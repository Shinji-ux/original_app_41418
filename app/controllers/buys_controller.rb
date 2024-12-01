class BuysController < ApplicationController

  def index
  end

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
    @categories = Category.all
    if @buy.save
      redirect_to root_path, notice: 'Buy was successfully created.'
    else
      Rails.logger.debug(@buy.errors.full_messages.join(", "))  # エラーメッセージをログに出力
    flash.now[:alert] = "保存に失敗しました: " + @buy.errors.full_messages.join(", ")
      @items = Item.all
      @categories = Category.all
      render :new
    end
  end

 

  def order_index
  end

  private 
  def buy_params
    params.require(:buy).permit(:transaction_date, :total_price, buy_items_attributes: [:id, :item_price, :quantity, :category_id, :item_id, :destroy])
  end

end
