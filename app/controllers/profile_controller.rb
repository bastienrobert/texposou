class ProfileController < Devise::RegistrationsController

  before_action :set_user, only: [:show_profile, :edit_profile, :update_profile]
  prepend_before_action :authenticate_scope!, only: [:edit, :update, :destroy, :show_profile]
  prepend_before_action :set_minimum_password_length, only: [:new, :edit, :show_profile]
  before_action :authenticate_user!, except: [:index_by_status, :show_by_id]


  def show_profile
    @exhibitions = [];
    current_user.places.each do |p|
      p.exhibitions.each do |e|
        @exhibitions << e
      end
    end
    @participations = Participation.where(user_id: current_user.id)
    render "show"
  end

  def index_by_status
    if params[:status]
      @users = User.where(main_status: params[:status])
    end
  end

  def show_by_id
    if params[:id] && User.find(params[:id])
      @user = User.find(params[:id])
      render "visit"
    else
      flash[:notice] = "Cette page n'existe pas"
      redirect_to root_path
    end
  end

  def new
    if params[:status]
      if params[:status] == "artist" || params[:status] == "particular" || params[:status] == "professional"
        @status = params[:status]
      end
    end
    super
  end


  def after_sign_up_path_for(resource)
    show_profile_path
  end

  def update_profile
    respond_to do |format|
      if @user.update(profile_params)
        format.html { redirect_to show_profile_path, notice: "Votre profile a été mis à jour avec succès" }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render 'profile/show' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      if current_user
        @user = current_user
      else
        flash[:notice] = "Vous devez vous authentifiez avec d'acceder a cette section"
        redirect_to root_path
      end
    end

    def sign_up_params
      params.require(:user).permit(:firstname, :lastname, :email, :password, :password_confirmation, :main_status)
    end

    def profile_params
      params.require(:user).permit(:firstname, :lastname, :address, :city, :zipcode, :firstname, :tel, :website, :bio, :all_tags, :avatar, :main_status, image_users_attributes:[ :id, :alt, :file, :_destroy ])
    end
end
