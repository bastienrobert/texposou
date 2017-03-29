class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.

  protect_from_forgery with: :exception
  before_filter :set_locale
  before_action :configure_devise_parameters, if: :devise_controller?

  def home 
  end

  def configure_devise_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:email, :password, :password_confirmation, :firstname, :lastname, :adress, :city, :postal, :phone) }
  end

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to issues_path, notify: 'Accès interdit'
  end




  private
    def set_locale
      I18n.locale = params[:locale] || I18n.default_locale
      Rails.application.routes.default_url_options[:locale]= I18n.locale
    end

end
