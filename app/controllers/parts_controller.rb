class PartsController < ApplicationController

  before_action :set_part, only: [:show, :edit, :update, :destroy]
  #before_action :authorize, only: [:edit, :update, :destroy]
  def index
    @parts = Part.all
    authorize! :read, Part
  end

  def show
    authorize! :read, @part
  #  @city = @countries.cities
  end

  def new
      @part = Part.new
      authorize! :create, @part
  end

  def edit
    authorize! :edit, @part
  end

  def create
    @part = Part.new(part_params)
    authorize! :create, @part

    if @part.save
      redirect_to root_url, notice: 'Part was successfully created.'
    else
      render :new
    end
  end

  def update
    authorize! :update, @part
    if @part.update(category_params)
      redirect_to root_url, notice: 'Part was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    authorize! :destroy, @part
    @part.destroy
    redirect_to countries_url, notice: 'Part was successfully destroyed.'
  end


  private
  # Use callbacks to share common setup or constraints between actions.
  def set_part
    @category = Part.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def part_params
    params.require(:part).permit(:description)
  end

end
