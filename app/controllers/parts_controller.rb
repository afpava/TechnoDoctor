class PartsController < ApplicationController

  before_action :set_part, only: [:show, :edit, :update, :destroy]
  #before_action :authorize, only: [:edit, :update, :destroy]
  def index
    @parts = Part.all
  end

  def show
  #  @city = @countries.cities
  end

  def new
      @part = Part.new
  end

  def edit
  end

  def create
    @part = Part.new(part_params)

    if @part.save
      redirect_to root_url, notice: 'Part was successfully created.'
    else
      render :new
    end
  end

  def update
    if @part.update(category_params)
      redirect_to root_url, notice: 'Part was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
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
