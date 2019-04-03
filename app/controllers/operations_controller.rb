class OperationsController < ApplicationController

    before_action :set_operation, only: [:show, :edit, :update, :destroy]
    #before_action :authorize, only: [:edit, :update, :destroy]
    def index
      @operations = Operation.all
    end

    def show
    #  @city = @countries.cities
    end

    def new
        @operation = Operation.new
    end

    def edit
    end

    def create
      @operation = Operation.new(operation_params)

      if @operation.save
        redirect_to root_url, notice: 'Operation was successfully created.'
      else
        render :new
      end
    end

    def update
      if @operation.update(operation_params)
        redirect_to root_url, notice: 'Operation was successfully updated.'
      else
        render :edit
      end
    end

    def destroy
      @operation.destroy
      redirect_to countries_url, notice: 'Operation was successfully destroyed.'
    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_operation
      @operation = Operation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def operation_params
      params.require(:operation).permit(:description)
    end
end
