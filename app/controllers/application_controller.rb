class ApplicationController < ActionController::Base
  include Pagy::Backend

  # before_action :require_login, except: [:new, :create]
  # skip_before_action :require_login, only: [:new, :create]
  rescue_from "AccessGranted::AccessDenied" do |exception|
    redirect_to root_path, alert: "You don't have permission to access this page."
  end

  private

  def require_login
    unless current_user
      flash.now.alert = 'You must be logged in to view this site'
      render ('sessions/first.html.erb')
    end
  end

  def authorize_admin
    redirect_to root_path, alert: 'You can view and edit only yours profile.' unless @user.id == current_user.id || @task&.user&.id == current_user.id
  end

  def current_user
    begin
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    rescue
      session[:user_id] = nil
    end
  end

  helper_method :current_user

end
