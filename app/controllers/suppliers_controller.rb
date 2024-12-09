class SuppliersController < ApplicationController
  def index
    @suppliers = current_user.suppliers.order("suppliers.company ASC")
  end
  
  def new
    @supplier = current_user.suppliers.new
  end

  def show
    @supplier = current_user.suppliers.find(params[:id])
  end

  def create
    @supplier = current_user.suppliers.new(supplier_params)
    if @supplier.save
      flash[:notice] = "仕入れ先を登録しました"
      redirect_to new_supplier_path
    else
      flash[:alert] = "仕入れ先の登録に失敗しました"
      render :new
    end
  end

  def edit
    @supplier = current_user.suppliers.find(params[:id])
  end

  def update
    @supplier = current_user.suppliers.find(params[:id])
    if @supplier.update(supplier_params)
      redirect_to suppliers_path
    else
      render :edit
    end
  end

  def destroy
    supplier = current_user.suppliers.find(params[:id])
    supplier.destroy
    redirect_to suppliers_path
  end

  def order_index
    @suppliers = current_user.suppliers.order("suppliers.company ASC")
  end

  def import
    Supplier.import_from_csv(params[:file], current_user)
    redirect_to suppliers_path, notice: "Suppliers imported."
  end

  private
  def supplier_params
    params.require(:supplier).permit(:company, :city, :address, :phone).merge(user_id: current_user.id)
  end
end
