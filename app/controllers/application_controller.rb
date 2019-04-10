class ApplicationController < ActionController::Base
  include Pagy::Backend
  before_action :require_login, except: [:new, :create]

  rescue_from "AccessGranted::AccessDenied" do |exception|
    redirect_to root_path, alert: "You don't have permission to access this page."
  end
  rescue_from Pagy::OverflowError, with: :redirect_to_last_page

  helper_method :current_user
  private

  def require_login
    unless current_user
      flash.now.alert = 'You must be logged in to view this site'
      redirect_to root_path
    end
  end

  def current_user
    begin
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    rescue
      session[:user_id] = nil
    end
  end


end
