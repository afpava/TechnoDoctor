class CustomersController < ApplicationController
  before_action :set_ticket, only: [ :destroy, :edit, :update]
  #before_action :authorize, only: [:edit, :update, :destroy]
  def index
    @customers = Customer.all.includes(:user, :tickets )
  end


end
