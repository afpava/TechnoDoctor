class BrandsController < ApplicationController

  before_action :set_category, only: [:index, :new, :create]
  before_action :set_brand, only: [:show, :destroy, :edit, :update]

  #before_action :authorize, only: [:edit, :update, :destroy]
  def index
     @pagy, @brands = pagy(Brand.by_category(params[:id]), items: 5)
     authorize! :read, Brand
  end

  def show
    @pagy, @models = pagy(@brand.models)
    authorize! :read, @brand
  end

  def new
    @brand = @category.brands.build
    authorize! :create, @brand
  end

  def edit
    authorize! :edit, @brand

  end

  def create
    authorize! :create, @brand
    @brand = @category.brands.create(brand_params)

    if @brand.save
      redirect_to category_path(@category), notice: 'Brand was successfully created.'
    else
      redirect_to category_path(@category), alert: 'Brand can not be blank or exists.'
    end
  end

  def update
    authorize! :update, @brand
    if @brand.update(brand_params)
      redirect_to category_path(@category), notice: 'Brand was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    authorize! :destory, @brand
    @brand.destroy
    redirect_to category_path(@category), notice: 'Brand was successfully destroyed.'
  end


  private
  # Use callbacks to share common setup or constraints between actions.
  def set_brand
    set_category
    @brand = @category.brands.find(params[:id]) if params[:id]
  end

  def set_category
    @category = Category.find(params[:category_id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def brand_params
    params.require(:brand).permit(:description)
  end

end
