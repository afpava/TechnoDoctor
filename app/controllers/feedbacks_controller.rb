class FeedbacksController < ApplicationController

    before_action :set_feedback, only: [ :destroy, :edit, :update]
    #before_action :authorize, only: [:edit, :update, :destroy]
    def index
      @feedbacks = current_user.feedbacks
    end

    def new
      @feedback = current_user.feedbacks.build
    end

    def show
      @feedback = Feedback.find(params[:id])
      authorize! :read, @feedback
    end


    def create
      @feedback = current_user.feedbacks.create(feedback_params)
      authorize! :create, @feedback

      if @feedback.save
        redirect_to users_path, notice: 'Feedback was successfully created.'
      else
        render :new
      end
    end

    def update
      authorize! :update, @feedback
      if @feedback.update(feedback_params)
        redirect_to users_path, notice: 'Feedback was successfully updated.'
      else
        render :edit
      end
    end

    def destroy
      authorize! :destroy, @feedback
      @feedback.destroy
      redirect_to users_path, notice: 'Feedback was successfully destroyed.'
    end


    private
    # Use callbacks to share common setup or constraints between actions.
    def set_feedback
      @feedback = current_user.feedbacks.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def feedback_params
      params.require(:feedback).permit(:title, :text)
    end

end
