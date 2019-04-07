class CustomersController < ApplicationController
  # before_action :set_ticket, only: [ :destroy, :edit, :update]
    before_action :set_customer, only: [:show, :edit, :update, :destroy]

  def index
  @pagy,  @customers = pagy(Customer.all.includes(:user, :tickets ), items: 5)
  end

  def new
    @customer = Customer.new
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    if @customer.update(customer_params)
      redirect_to customers_path, notice: 'Profile was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @customer.destroy
     redirect_to customers_path, notice: 'customer was successfully destroyed.'
  end

  def create
      @customer = Customer.new(customer_params)
        if @customer.save
      redirect_to customers_path , notice: "Customer is created."
    else
      render 'new'
    end
  end

private

  def set_customer
    @customer = Customer.find(params[:id])
  end


  def customer_params
      params.require(:customer).permit(:last_name, :first_name, :phone_number, :user_id)
  end



end
