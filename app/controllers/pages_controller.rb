class PagesController < ApplicationController
  skip_before_action :require_login

  def index
    @randon_feedbacks = Feedback.published.random
    render template: "pages/home"
  end

  def show
    if valid_page?
      @randon_feedbacks = Feedback.published.random
      @collaborators = Collaborator.all
      @categories = Category.all
      render template: "pages/#{params[:page]}"
    else
      render file: "public/error-page.html", status: :not_found
    end
  end

  private
   def valid_page?
     File.exist?(Pathname.new(Rails.root + "app/views/pages/#{params[:page]}.html.erb"))
   end

end
