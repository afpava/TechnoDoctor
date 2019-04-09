class UsersController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]
  before_action :set_user, only: [:show, :edit, :update, :destroy, :customerize]
      def new
          if current_user
            redirect_to root_path, alert: 'You are signed in, logout first.'
          else
            @user = User.new
          end
      end

      def index
        @user = current_user
        @customer = current_user.customer

        if !current_user.customer?
          @pagy, @tickets = pagy(Ticket.all.order(id: :desc), items: 6)
        else
          @tickets =@customer&.tickets
        end
      end

      def edit
        @user = User.find(params[:id])
      end

      def customerize
        phone = params[:user][:phone_number].delete('^0-9+')
        ticket_id = params[:user][:ticket_number].to_s.delete('^0-9+')
        customer_id = Customer.init_customer(phone, ticket_id).pluck(:id).first
        # binding.pry
        if customer_id.blank?
          redirect_to users_path, alert: "Ticket not found"
        else
          customer = Customer.find(customer_id)
          customer.users << current_user
          redirect_to users_path, notice: "Repares where sucsessfuly added."
        end
        # binding.pry
        # current_user.add_customer_relation(params[:user][:ticket_number].to_s, params[:user][:phone_number].to_s)
         # @task.update_attribute(:completed, params[:completed])
         # params[:completed] == "true" ? (redirect_to root_path, notice: "Todo item completed") : (redirect_to root_path, notice: "Todo item unchecked")
      end

      def update
        if @user.update(user_params)
          redirect_to root_path, notice: 'Profile was successfully updated.'
        else
          render :edit
        end
      end

      def destroy
        @user.destroy
         redirect_to root_url, notice: 'user was successfully destroyed.'
      end

      def create
          @user = User.new(user_params)
            if @user.save
          session[:user_id] = @user.id
          redirect_to root_path , notice: "Thank you for signing up!"
        else
          render 'new'
        end
      end

    private

      def set_user
        @user = User.find(params[:id])
      end


      def user_params
          params.require(:user).permit(:nickname, :last_name, :first_name, :birth_day, :gender, :provider, :country, :city, :avatar ,:email, :password, :password_confirmation)
      end

end
