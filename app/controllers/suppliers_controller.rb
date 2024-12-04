class SuppliersController < ApplicationController
  def index
    @suppliers = current_user.suppliers
  end
  
  def new
    @supplier = Supplier.new
  end

  def show
    @supplier = Supplier.find(params[:id])
  end

  def create
    @supplier = Supplier.new(supplier_params)
    if @supplier.save
      redirect_to new_supplier_path
    else
      render :new
    end
  end

  def edit
    @supplier = Supplier.find(params[:id])
  end

  def update
    @supplier = Supplier.find(params[:id])
    if @supplier.update(supplier_params)
      redirect_to suppliers_path
    else
      render :edit
    end
  end

  def destroy
    supplier = Supplier.find(params[:id])
    supplier.destroy
    redirect_to suppliers_path
  end

  def order_index
    @suppliers = current_user.suppliers
  end


  private
  def supplier_params
    params.require(:supplier).permit(:company, :city, :address, :phone).merge(user_id: current_user.id)
  end
end
