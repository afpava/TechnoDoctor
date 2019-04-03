class DisreparesController < ApplicationController

  before_action :set_disrepare, only: [:show, :edit, :update, :destroy]
  #before_action :authorize, only: [:edit, :update, :destroy]
  def index
    @disrepares = Disrepare.all
  end

  def show
  #  @city = @countries.cities
  end

  def new
      @disrepare = Disrepare.new
  end

  def edit
  end

  # POST /stores
  # POST /stores.json
  def create
    @disrepare = Disrepare.new(disrepare_params)

    if @disrepare.save
      redirect_to root_url, notice: 'Disrepare was successfully created.'
    else
      binding.pry
      render :new
    end
  end


  # PATCH/PUT /stores/1
  # PATCH/PUT /stores/1.json
  def update
    if @disrepare.update(disrepare_params)
      redirect_to root_url, notice: 'Disrepare was successfully updated.'
    else
      render :edit
    end
  end


  # DELETE /stores/1
  # DELETE /stores/1.json
  def destroy
    @disrepare.destroy
    redirect_to countries_url, notice: 'Disrepare was successfully destroyed.'
  end


  private
  # Use callbacks to share common setup or constraints between actions.
  def set_disrepare
    @disrepare = Disrepare.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def disrepare_params
    params.require(:disrepare).permit(:description)
  end

end
