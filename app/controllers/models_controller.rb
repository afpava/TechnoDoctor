class ModelsController < ApplicationController

  before_action :set_model, only: [:index, :show, :destroy, :edit, :update]
  #before_action :authorize, only: [:edit, :update, :destroy]

  def index
    @pagy, @models = pagy(Model.all)
    authorize! :read, Model
  end

  def show

    authorize! :read, Model
  end

  def new
    @brand = Brand.find(params[:brand_id])
    @model = @brand.models.build
    authorize! :create, @model
  end

  def create
    @brand = Brand.find(params[:brand_id])
    @model = @brand.models.create(model_params)
    authorize! :create, @model

    if @model.save
      redirect_back(fallback_location: categories_path(@brand), notice: 'Model was successfully created.')
    else
      render :new
    end
  end

  def update
    authorize! :update, @model
    if @model.update(model_params)
      redirect_back(fallback_location: categories_path(@brand), notice: 'Model was successfully updated.')
    else
      render :edit
    end
  end

  def destroy
    authorize! :destroy, @model
    @model.destroy
    redirect_back(fallback_location: categories_path(@brand), notice: 'Model was successfully destroyed.')
  end


  private
  # Use callbacks to share common setup or constraints between actions.
  def set_model
    @brand = Brand.find(params[:brand_id])
    @model = @brand.models.find(params[:id])

  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def model_params
    params.require(:model).permit(:description)
  end

end
