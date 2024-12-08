class SellsController < ApplicationController

  def new
    @customer = current_user.customers.find(params[:customer_id])
    @sell = current_user.sells.new
    @sell.sell_items.build
    @items = current_user.items
    @categories = current_user.categories
  end

  def create
    @customer = current_user.customers.find(params[:customer_id])
    @sell = current_user.sells.new(sell_params.merge(customer_id: @customer.id))
    @categories = current_user.categories
    if @sell.save
      redirect_to root_path, notice: 'Sell was successfully created.'
    else
      @items = current_user.items
      @categories = current_user.categories
      render :new
    end
  end

  def edit
    @sell = current_user.sells.find(params[:id])
    @customer = @sell.customer
    @categories = current_user.categories
    @items = current_user.items
  end

  def update
    @sell = current_user.sells.find(params[:id])
    @customer = @sell.customer
    @categories = current_user.categories
    @items = current_user.items
    if @sell.update(sell_params)
      redirect_to sells_order_index_path
    else
      render :edit
    end
  end

  def destroy
    sell = current_user.sells.find(params[:id])
    sell.destroy
    redirect_to sells_order_index_path
  end

  def search
    @customers = current_user.customers.order("customers.company ASC")
  end

  def receipt
    @customer_id = params[:customer_id]
    @start_date = params[:start_date]
    @end_date = params[:end_date]
    @customer = current_user.customers.find(@customer_id)

    @receipts = current_user.sells.where(customer_id: @customer_id)
                                  .where("transaction_date >= ?", @start_date)
                                  .where("transaction_date <= ?", @end_date)
                                  .order("sells.transaction_date ASC")
                                  .distinct
  end

  def order_index
    @sells = current_user.sells.order("sells.transaction_date DESC")
  end

  private 
  def sell_params
    params.require(:sell).permit(:transaction_date, :total_price, sell_items_attributes: [:id, :item_price, :quantity, :category_id, :item_id, :destroy]).merge(user_id: current_user.id)
  end
end
