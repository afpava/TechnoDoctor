class DevicesController < ApplicationController
  before_action :set_device, only: [:show, :edit, :update, :destroy]
  before_action :set_relations, only: [:new, :edit]

  def index
      @pagy, @devices = pagy(Device.all, items: 5)
      authorize! :read, Device
  end

  def show
      @device = Device.find(params[:id])
      authorize! :read, @device
  end

  def new
      @device = Device.new
  end

  def create
    @device = Device.new(device_params)
    authorize! :create, @device

    if @device.save
      redirect_to devices_path, notice: 'Device was successfully created.'
    else
      render :new
    end
  end

  def update
    authorize! :update, @device
    if @device.update(device_params)
      redirect_to devices_path, notice: 'Device was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    authorize! :destroy, @device
    @device.destroy
    redirect_back(fallback_location: devices_path, notice: 'Device was successfully destroyed.')
  end


  private
  # Use callbacks to share common setup or constraints between actions.
  def set_device
    @device = Device.find(params[:id])
  end

  def set_relations
    @brand_arr = Brand.pluck(:description, :id)
    @model_arr = Model.pluck(:description, :id)
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def device_params
    params.require(:device).permit(:imei, :serial_num, :model_id)
  end

  def redirect_to_last_page(e)
   redirect_to url_for(page: e.pagy.last), notice: "Page ##{params[:page]} does't exist. Showing page #{e.pagy.last} instead."
 end

end
