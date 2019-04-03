class CategoriesController < ApplicationController

  before_action :set_category, only: [:show, :edit, :update, :destroy]
  #before_action :authorize, only: [:edit, :update, :destroy]
  def index
    @pagy, @categories = pagy(Category.all, items: 5)
  end

  def show
      @pagy, @brands = pagy(Brand.by_category(params[:id]), items: 5)
    
  end

  def new
      @category = Category.new
  end

  def edit
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      redirect_back(fallback_location: categories_path, notice: 'Category was successfully created.')
    else
      render :new
    end
  end

  def update
    if @category.update(category_params)
      redirect_to categories_path, notice: 'Category was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @category.destroy
    redirect_back(fallback_location: categories_path, notice: 'Category was successfully destroyed.')
  end


  private
  # Use callbacks to share common setup or constraints between actions.
  def set_category
    @category = Category.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def category_params
    params.require(:category).permit(:description)
  end

end
