class CategoriesController < ApplicationController
  def index
    @categories = current_user.categories.order("categories.category ASC")
  end

  def new
    @category = current_user.categories.new
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
    @category = current_user.categories.find(params[:id])
  end

  def update
    @category = current_user.categories.find(params[:id])
    if @category.update(category_params)
      redirect_to categories_path
    else
      render :edit
    end
  end

  def destroy
    category = current_user.categories.find(params[:id])
    category.destroy
    redirect_to categories_path
  end

  def items
    @items = current_user.items.where(category_id: params[:category_id])
    render json: { items: @items }
  end

  def import
    def import
      Category.import_from_csv(params[:file], current_user)
      redirect_to categories_path
    end
  end

  def search
    @categories = current_user.categories
  end

  def buy_receipt
    @category_id = params[:category_id]
    @category = current_user.categories.find(@category_id)
    @start_date = params[:start_date]
    @end_date = params[:end_date]
    @buy_receipts = current_user.buys.joins(buy_items: :item)
                                    .where(items: { category_id: @category_id })
                                    .where("transaction_date >= ?", @start_date)
                                    .where("transaction_date <= ?", @end_date)
                                    .order("buys.transaction_date ASC")
                                    .distinct
  end

  def sell_receipt
    @category_id = params[:category_id]
    @category = current_user.categories.find(@category_id)
    @start_date = params[:start_date]
    @end_date = params[:end_date]
    @sell_receipts = current_user.sells.joins(sell_items: :item)
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
