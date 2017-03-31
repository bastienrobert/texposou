class ParticipationsController < ApplicationController
  before_action :set_participation, only: [:show, :edit, :update, :destroy, :confirm, :unconfirm]
  before_action :authenticate_user!, only: [:new, :create, :update, :destroy, :confirm, :unconfirm]
  before_action :authenticate_owner, only: [:confirm, :unconfirm]
  authorize_resource

  # GET /participations
  # GET /participations.json
  def index
    @participations = Participation.all
  end

  # GET /participations/1
  # GET /participations/1.json
  def show
  end

  def confirm
    @participation.confirm = true
    @participation.save
    redirect_to show_profile_path
  end

  def unconfirm
    @participation.confirm = false
    @participation.save
    redirect_to show_profile_path
  end

  # GET /participations/new
  def new
    @participation = Participation.new
    if params[:exhibition_id] && Exhibition.find(params[:exhibition_id])
      @participation.exhibition = Exhibition.find(params[:exhibition_id])
      if Participation.find_by(exhibition: @participation.exhibition, user: current_user)
        flash[:notice] = "Vous participez déja à cet évenement"
        redirect_to @participation.exhibition
      end
    end
  end

  # GET /participations/1/edit
  def edit
  end



  # POST /participations
  # POST /participations.json
  def create
    @participation = Participation.new(participation_params)
    @participation.user = current_user
    respond_to do |format|
      if @participation.save
        format.html { redirect_to @participation.exhibition, notice: 'Participation was successfully created.' }
        format.json { render :show, status: :created, location: @participation }
      else
        format.html { render :new }
        format.json { render json: @participation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /participations/1
  # PATCH/PUT /participations/1.json
  def update
    respond_to do |format|
      if @participation.update(participation_params)
        format.html { redirect_to @participation, notice: 'Participation was successfully updated.' }
        format.json { render :show, status: :ok, location: @participation }
      else
        format.html { render :edit }
        format.json { render json: @participation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /participations/1
  # DELETE /participations/1.json
  def destroy
    if @participation.user.id != current_user.id && @participation.exhibition.place.user.id != current_user.id
      flash[:notice] = "Vous ne pouvez pas désinscrire ce user"
      redirect_to @participation.exhibition
    end
    exhibition = @participation.exhibition
    @participation.destroy
    respond_to do |format|
      format.html { redirect_to exhibition, notice: 'Participation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_participation
      @participation = Participation.find(params[:id])
    end

    def authenticate_owner
      if @participation.exhibition.place.user.id != current_user.id
        flash[:notice] = "Vous ne pouvez pas désinscrire ce user"
        redirect_to @participation.exhibition
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def participation_params
      params.require(:participation).permit(:area, :exhibition_id)
    end
end
