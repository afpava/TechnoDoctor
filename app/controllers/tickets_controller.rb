class TicketsController < ApplicationController

  before_action :set_ticket, only: [ :destroy, :edit, :update]
  def index
    @tickets = Ticket.all.includes(:customer,{ device: [:model]}, :collaborator )
    authorize! :read, Ticket
  end

  def show
    @ticket = Ticket.find(params[:id])
    @customer = @ticket.customer
    @device = @ticket.device
    @collaborator = @ticket.collaborator
    @collaborators = Collaborator.all
    @disrepares = @ticket.disrepares
    @parts = @ticket.parts
    @operations = @ticket.operations

    authorize! :read, @ticket

  end

  def new
    @customer = Customer.find(params[:customer_id])
    # @passenger = Passenger.find(params[:passenger_id])
    @ticket = @customer.tickets.build
    # binding.pry
    @part = @ticket.parts.build
    # @disrepares = @ticket.disrepares.build
    # @operations = @ticket.operations.build
    # authorize! :create, @ticket
  end

  def edit
    @model_arr = Model.pluck(:description, :id)
    @collab_arr = Collaborator.pluck(:nickname, :id)
    @ticket_param = Ticket.stages.keys
      # binding.pry
    if params[:category_id]
      @category = Category.find(params[:category_id])
    else
      @category = Category.find(1)
    end

    @disrepares = @category.disrepares

    @pagy, @parts = pagy(Part.all, items: 3)
    @customers = Customer.all
    @operations = Operation.all
    # authorize! :edit, @ticket
    #@ticket = ticket.find(params[:id]).country
  end

  def create
    @customer = Customer.find(params[:customer_id])
    @ticket = @customer.tickets.create(ticket_params)

    @ticket = ticket.new(ticket_params)
    # authorize! :create, @ticket
    if @ticket.save
      # redirect_to passenger_path(@passenger), notice: 'ticket was successfully created.'
    else
      render :new
    end
  end

  def update
    if @ticket.update(ticket_params)
      # binding.pry
        # if params[:ticket][:collaborator].present?
        #   collaborator = Collaborator.find(params[:ticket][:collaborator])
        #   collaborator.tickets << @ticket
        # end
        collaborator_id = params[:ticket][:collaborator]
        @ticket.update_relation(collaborator_id, 'collaborator', @ticket)

        # if params[:ticket][:customer_id].present?
        #   customer = Customer.find(params[:ticket][:customer_id])
        #   customer.tickets << @ticket
        # end
        customer_id = params[:ticket][:customer_id]
        @ticket.update_relation(customer_id, 'customer', @ticket)

        # disrepares_ids = @ticket.disrepares.ids
        # customer = Customer.find(params[:ticket][:customer_id])
        disrepares_new_ids = params[:disrepares][:disrepares_ids].reject(&:blank?).map(&:to_i)
        @ticket.update_relations(disrepares_new_ids, 'disrepare', @ticket)

        #parst
        parts_new_ids = params[:parts][:parts_ids].reject(&:blank?).map(&:to_i)
        @ticket.update_relations(parts_new_ids, 'part', @ticket)

        #operations
        operations_new_ids = params[:operations][:operations_ids]&.reject(&:blank?).map(&:to_i)
        @ticket.update_relations(operations_new_ids, 'operation', @ticket)
       #  disrepares_remove_ids = disrepares_ids - disrepares_new_ids
       #  disrepares_add_ids = disrepares_new_ids - disrepares_ids
       #
       #  disrepares_remove_ids.each do |id|
       #     @ticket.disrepares.delete(id)
       # end
       #
       #  disrepares_add_ids.each do |disrepare_id|
       #      disrepare = Disrepare.find(disrepare_id)
       #      @ticket.disrepares << disrepare
       #  end
       @ticket.sum_prices(@ticket)
      authorize! :update, @ticket
      redirect_to ticket_path(@ticket), notice: 'ticket was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    authorize! :destroy, @ticket
    @ticket.destroy
    redirect_to tickets_path, notice: 'ticket was successfully destroyed.'
  end


  private
  # Use callbacks to share common setup or constraints between actions.
  def set_ticket
    @ticket = Ticket.find(params[:id])
    # @ticket = @customer.tickets.find(params[:id])
    # @customer = Customer.find(params[:customer_id])
    @customer = @ticket.customer
    @device = @ticket.device
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def ticket_params
    params.require(:ticket).permit(:orient_price, :prepayment, :stage, :in_date, :orient_date, :total_price,
      parts_attributes: [ :id, :description, :price, :quantity, :ticket_id, _destroy ],
      disrepares_attributes: [ :id, :description, :category_id, _destroy ],
     operations_attributes: [ :id, :description, :price, :category_id, _destroy ],
    )
  end

end
