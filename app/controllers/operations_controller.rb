class OperationsController < ApplicationController

    before_action :set_operation, only: [:show, :edit, :update, :destroy]
    before_action :set_category, only: [:index, :new, :create]
    #before_action :authorize, only: [:edit, :update, :destroy]

    def index
      @pagy, @operations = pagy(Operation.by_category(params[:id]))
    end

    def new
      @operation = @category.operations.build
    end

    def create
      @operation = @category.operations.create(operation_params)

      if @operation.save
        redirect_to category_path(@category), notice: 'Operation was successfully created.'
      else
        redirect_to category_path(@category), alert: 'Operation can not be blank or exists.'
      end
    end

    def update
      if @operation.update(brand_params)
        redirect_to category_path(@category), notice: 'Operation was successfully updated.'
      else
        render :edit
      end
    end

    def destroy
      @operation.destroy
      redirect_to category_path(@category), notice: 'Operation was successfully destroyed.'
    end


    private
    # Use callbacks to share common setup or constraints between actions.
    def set_operation
      set_category
      @operation = @category.operations.find(params[:id]) if params[:id]
    end

    def set_category
      @category = Category.find(params[:category_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def operation_params
      params.require(:operation).permit(:description, :price)
    end
end
