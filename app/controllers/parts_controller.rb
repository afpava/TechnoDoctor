class PartsController < ApplicationController

  before_action :set_part, only: [:show, :edit, :update, :destroy]

  def index
    @pagy ,@parts = pagy(Part.all, items: 5)
    authorize! :read, Part
  end

  def show
    authorize! :read, @part
  #  @city = @countries.cities
  end

  def new
      @ticket = Ticket.find(params[:ticket_id])
      @part = @ticket.parts.build
      # authorize! :create, @part
  end

  def edit
    authorize! :edit, @part
  end

  def create
    @part = Part.new(part_params)
    # authorize! :create, @part

    if @part.save
      redirect_to ticket_path(@part.ticket), notice: 'Part was successfully created.'
    else
      redirect_to ticket_path(@part.ticket), alert: 'Part was not created.'
    end
  end

  def update
    authorize! :update, @part
    if @part.update(category_params)
      redirect_to ticket_path(@part), notice: 'Part was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    authorize! :destroy, @part
    @part.destroy
    redirect_to ticket_path(@part), notice: 'Part was successfully destroyed.'
  end


  private
  # Use callbacks to share common setup or constraints between actions.
  def set_part
    @part = Part.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def part_params
    params.require(:part).permit(:description, :ticket_id, :price,:quantity)
  end

end
