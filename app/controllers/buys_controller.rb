class BuysController < ApplicationController

  def new
    @supplier = current_user.suppliers.find(params[:supplier_id])
    @buy = current_user.buys.new
    @buy.buy_items.build
    @items = current_user.items
    @categories = current_user.categories
  end

  def create
    @supplier = current_user.suppliers.find(params[:supplier_id])
    @buy = current_user.buys.new(buy_params.merge(supplier_id: @supplier.id))
    @categories = current_user.categories
    if @buy.save
      redirect_to root_path
    else
      @items = current_user.items
      @categories = current_user.categories
      render :new
    end
  end

  def edit
    @buy = current_user.buys.find(params[:id])
    @supplier = @buy.supplier
    @categories = current_user.categories
    @items = current_user.items
  end

  def update
    @buy = current_user.buys.find(params[:id])
    @supplier = @buy.supplier
    @categories = current_user.categories
    @items = current_user.items
    if @buy.update(buy_params)
      redirect_to buys_order_index_path
    else
      render :edit
    end
  end

  def destroy
    buy = current_user.buys.find(params[:id])
    buy.destroy
    redirect_to buys_order_index_path
  end

  def search
    @suppliers = current_user.suppliers.order("suppliers.company ASC")
  end
  
  def receipt
    @supplier_id = params[:supplier_id]
    @start_date = params[:start_date]
    @end_date = params[:end_date]
    @supplier = current_user.suppliers.find(@supplier_id)

    @receipts = current_user.buys.where(supplier_id: @supplier_id)
                                .where("transaction_date >= ?", @start_date)
                                .where("transaction_date <= ?", @end_date)
                                .order("buys.transaction_date ASC")
                                .distinct
  end

  def order_index
    @buys = current_user.buys.order("buys.transaction_date DESC")
  end

  def show
    @user = current_user
    @buy = current_user.buys.find(params[:id])
    @supplier = @buy.supplier
    @categories = current_user.categories
    @items = current_user.items
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: 'show', # 出力されるPDFのファイル名
               template: 'buys/show', # テンプレートファイルの指定
               layout: 'layouts/pdf',
               encoding: 'UTF-8' # エンコーディングを指定
      end
    end
  end

  private 
  def buy_params
    params.require(:buy).permit(:transaction_date, :total_price, buy_items_attributes: [:id, :item_price, :item_total_price, :quantity, :category_id, :item_id, :destroy]).merge(user_id: current_user.id)
  end

end
