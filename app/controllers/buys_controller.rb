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
    @categories = Category.all
    if @buy.save
      redirect_to root_path, notice: 'Buy was successfully created.'
    else
      @items = Item.all
      @categories = Category.all
      render :new
    end
  end

  def edit
    @buy = Buy.find(params[:id])
    @supplier = @buy.supplier
    @categories = Category.all
    @items = Item.all
  end

  def update
    @buy = Buy.find(params[:id])
    @supplier = @buy.supplier
    @categories = Category.all
    @items = Item.all
    if @buy.update(buy_params)
      redirect_to buys_order_index_path
    else
      render :edit
    end
  end

  def destroy
    buy = Buy.find(params[:id])
    buy.destroy
    redirect_to buys_order_index_path
  end

  def search
    @suppliers = Supplier.all
  end
  
  def receipt
    @supplier_id = params[:supplier_id]
    @start_date = params[:start_date]
    @end_date = params[:end_date]

    @receipts = Buy.where(supplier_id: @supplier_id)
                    .where("transaction_date >= ?", @start_date)
                    .where("transaction_date <= ?", @end_date)
                    .order("buys.transaction_date ASC")
                    .distinct
  end


  def order_index
    @buys = Buy.all
  end

  private 
  def buy_params
    params.require(:buy).permit(:transaction_date, :total_price, buy_items_attributes: [:id, :item_price, :quantity, :category_id, :item_id, :destroy]).merge(user_id: current_user.id)
  end

end
