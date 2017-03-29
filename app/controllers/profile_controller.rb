class ProfileController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]

  def show
  end

  def show_by_id
    if params[:id] && User.find(params[:id])
      @user = User.find(params[:id])
      render "visit"
    end
  end

  def edit
  end



  def update
    respond_to do |format|
      if @user.update(profile_params)
        format.html { redirect_to show_profile_path, notice: "Votre profile a été mis à jour avec succés" }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
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

    def profile_params
      params.require(:user).permit(:firstname, :lastname, :address, :city, :zipcode, :firstname, :tel, :all_tags, image_users_attributes:[ :id, :alt, :file, :_destroy ])
    end
end
