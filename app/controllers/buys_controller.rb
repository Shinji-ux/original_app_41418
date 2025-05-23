class BuysController < ApplicationController
  def order_index
    @buys = current_user.buys.order("buys.transaction_date DESC")
                             .page(params[:page]).per(20)
  end

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

  def search_result
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

  def issue_receipt
    @suppliers = current_user.suppliers.order("suppliers.company ASC")
  end
  
  def receipt
    @user = current_user
    @supplier_id = params[:supplier_id]
    @start_date = params[:start_date]
    @end_date = params[:end_date]
    @pay_date = params[:pay_date]
    @supplier = current_user.suppliers.find(@supplier_id)

    @receipts = current_user.buys.where(supplier_id: @supplier_id)
                                .where("transaction_date >= ?", @start_date)
                                .where("transaction_date <= ?", @end_date)
                                .order("buys.transaction_date ASC")
                                .distinct
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: 'receipt', # 出力されるPDFのファイル名
                template: 'buys/receipt', # テンプレートファイルの指定
                layout: 'layouts/pdf',
                enable_local_file_access: true, # ローカルファイルの読み込みを許可
                enable_internal_file_access: true,
                page_size: 'A5'
                #  orientation: 'Landscape'    # 横向きに設定
      end
    end
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
               enable_local_file_access: true, # ローカルファイルの読み込みを許可
               enable_internal_file_access: true,
               page_size: 'A5'
               #  orientation: 'Landscape'    # 横向きに設定
      end
    end
  end

  private 
  def buy_params
    params.require(:buy).permit(:transaction_date, :total_price, buy_items_attributes: [:id, :item_price, :item_total_price, :quantity, :category_id, :item_id, :destroy])
                        .merge(user_id: current_user.id)
  end

end
