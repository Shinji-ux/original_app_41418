class CategoriesController < ApplicationController
  def index
    @categories = current_user.categories
  end

  def new
    @category = Category.new
  end

  def create
    @category = current_user.categories.new(category_params)
    if @category.save
      redirect_to new_category_path
    else
      render :new
    end
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    if @category.update(category_params)
      redirect_to categories_path
    else
      render :edit
    end
  end

  def destroy
    category = Category.find(params[:id])
    category.destroy
    redirect_to categories_path
  end

  def items
    @items = Item.where(category_id: params[:category_id])
    render json: { items: @items }
  end

  def search
    @categories = current_user.categories
  end

  def buy_receipt
    @category_id = params[:category_id]
    @category = Category.find(@category_id)
    @start_date = params[:start_date]
    @end_date = params[:end_date]
    @buy_receipts = Buy.joins(buy_items: :item)
                        .where(items: { category_id: @category_id })
                        .where("transaction_date >= ?", @start_date)
                        .where("transaction_date <= ?", @end_date)
                        .order("buys.transaction_date ASC")
                        .distinct
  end

  def sell_receipt
    @category_id = params[:category_id]
    @category = Category.find(@category_id)
    @start_date = params[:start_date]
    @end_date = params[:end_date]
    @sell_receipts = Sell.joins(sell_items: :item)
                        .where(items: { category_id: @category_id })
                        .where("transaction_date >= ?", @start_date)
                        .where("transaction_date <= ?", @end_date)
                        .order("sells.transaction_date ASC")
                        .distinct
  end

  private
  def category_params
    params.require(:category).permit(:category)
  end
end
