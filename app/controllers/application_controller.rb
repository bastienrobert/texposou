class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.

  ## Vars for translations of Devices
  # protect_from_forgery with: :exception
  #
  # before_filter :set_locale
  #
  # private
  #   def set_locale
  #     I18n.locale = "fr"
  #   end
  ## HALT

  protect_from_forgery with: :exception
  before_action :configure_devise_parameters, if: :devise_controller?

  def configure_devise_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:email, :password, :password_confirmation, :firstname, :lastname, :adress, :city, :postal, :phone) }
  end

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to issues_path, notify: 'Accès interdit'
  end

end
