class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  include CanCan::ControllerAdditions


  protect_from_forgery with: :exception
  # before_filter :set_locale
  before_action :configure_devise_parameters, if: :devise_controller?


  rescue_from CanCan::AccessDenied do |exception|
    # flash[:warning] = exception.message
    flash[:notice] = exception.message
    #Rails regarde dans le mauvais fichier de route (celui de rails_admin donc on redirige en absolu)
    if current_user
      redirect_to "/"
    else
      redirect_to "/users/sign_in"
    end
  end


  def home
    @places = Place.last(5)
    @exhibition = Exhibition.last
    artists = User.where(main_status: "artist")
    artistWithAvatar = []
    artists.each do |a|
      if a.avatar.exists?
        artistWithAvatar << a
      end
    end
    @artist = artistWithAvatar.first
  end

  def about
  end

  def configure_devise_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:email, :password, :password_confirmation, :firstname, :lastname, :adress, :city, :postal, :phone) }
  end



  private
    def set_locale
      I18n.locale = params[:locale] || I18n.default_locale
      Rails.application.routes.default_url_options[:locale]= I18n.locale
    end

end
