class DisreparesController < ApplicationController
  before_action :set_category, only: [:index, :new, :create]
  before_action :set_disrepare, only: [:show, :edit, :update, :destroy]

  def index
    @disrepares = @category.disrepares.all
    authorize! :read, Disrepare
  end

  def new
    @disrepare = @category.disrepares.build
  end

  def create
    @disrepare = @category.disrepares.create(disrepare_params)
      authorize! :create, @disrepare
    if @disrepare.save
      redirect_to category_path(@category), notice: 'Disrepare was successfully created.'
    else
      redirect_to category_path(@category), alert: 'Disrepare can not be blank or exists.'
    end
  end

  def update
    authorize! :update, @disrepare
    if @disrepare.update(disrepare_params)
      redirect_to category_path(@category), notice: 'Disrepare was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    authorize! :destroy, @disrepare
    @disrepare.destroy
    redirect_to category_path(@category), notice: 'Disrepare was successfully destroyed.'
  end


  private
  # Use callbacks to share common setup or constraints between actions.


  def set_disrepare
    set_category
    @disrepare = @category.disrepares.find(params[:id]) if params[:id]
  end

  def set_category
    @category = Category.find(params[:category_id])
  end
  # Never trust parameters from the scary internet, only allow the white list through.
  def disrepare_params
    params.require(:disrepare).permit(:description)
  end

end
