class SuppliersController < ApplicationController
  def new
    @supplier = Supplier.new
  end

  def create
    @supplier = Supplier.new(supplier_params)
    if @supplier.save
      redirect_to new_supplier_path
    else
      render :new
    end
  end

  private
  def supplier_params
    params.require(:supplier).permit(:company, :city, :address, :phone).merge(user_id: current_user.id)
  end
end
