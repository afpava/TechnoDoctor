class CategoriesController < ApplicationController

  before_action :set_category, only: [:show, :edit, :update, :destroy]

  def index
      @pagy, @categories = pagy(Category.all, items: 5)
      authorize! :create, Category
  end

  def show
      @pagy, @brands = pagy(Brand.by_category(params[:id]), items: 5 )
      authorize! :read, @category
  end

  def new
      @category = Category.new
      authorize! :create, Category
  end

  def create
    @category = Category.new(category_params)
    authorize! :create, @category

    if @category.save
      redirect_back(fallback_location: categories_path, notice: 'Category was successfully created.')
    else
      render :new
    end
  end

  def update
    authorize! :update, @category
    if @category.update(category_params)
      redirect_to categories_path, notice: 'Category was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    authorize! :destroy, @category
    begin
        @category.destroy
        redirect_back(fallback_location: categories_path, notice: 'Category was successfully destroyed.')
    rescue
        redirect_back(fallback_location: categories_path, notice: 'Category is linked!.')
    end

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

  def redirect_to_last_page(e)
   redirect_to url_for(page: e.pagy.last), notice: "Page ##{params[:page]} does't exist. Showing page #{e.pagy.last} instead."
 end

end
