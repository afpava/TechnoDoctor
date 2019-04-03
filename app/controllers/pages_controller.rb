class PagesController < ApplicationController
  def show
    if valid_page?
      @collaborators = Collaborator.all
      @randon_feedbacks = Feedback.published.random
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
