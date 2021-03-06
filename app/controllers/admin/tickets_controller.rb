module Admin
  class TicketsController < Admin::ApplicationController
    # To customize the behavior of this controller,
    # you can overwrite any of the RESTful actions. For example:
    #
    # def index
    #   super
    #   @resources = Ticket.
    #     page(params[:page]).
    #     per(10)
    # end
    def update
      super
      ticket = Ticket.find(params[:id])
      ticket.sum_prices(ticket)
    end

    # Define a custom finder by overriding the `find_resource` method:
    # def find_resource(param)
    #   Ticket.find_by!(slug: param)
    # end

    # See https://administrate-prototype.herokuapp.com/customizing_controller_actions
    # for more information
  end

end
