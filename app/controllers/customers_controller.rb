class CustomersController < ApplicationController
  def index
    @customers = current_user.customers
  end
  
  def new
    @customer = current_user.customers.new
  end

  def show
    @customer = current_user.customers.find(params[:id])
  end

  def create
    @customer = current_user.customers.new(customer_params)
    if @customer.save
      redirect_to new_customer_path
    else
      render :new
    end
  end

  def edit
    @customer = current_user.customers.find(params[:id])
  end

  def update
    @customer = current_user.customers.find(params[:id])
    if @customer.update(customer_params)
      redirect_to customers_path
    else
      render :edit
    end
  end

  def destroy
    customer = current_user.customers.find(params[:id])
    customer.destroy
      redirect_to customers_path
  end

  def order_index
    @customers = current_user.customers
  end

  def import
    Customer.import_from_csv(params[:file], current_user)
    redirect_to customers_path, notice: "Customers imported."
  end

  private
  def customer_params
    params.require(:customer).permit(:company, :city, :address, :phone).merge(user_id: current_user.id)
  end
  
end
