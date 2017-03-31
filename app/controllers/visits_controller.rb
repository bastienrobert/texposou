class VisitsController < ApplicationController
  before_action :set_visit, only: [:show, :edit, :update, :destroy]
  before_action :set_authenticate_user, only:[:new, :create]
  before_action :set_owner_user, only:[:edit, :update, :destroy]

  authorize_resource

  # GET /visits
  # GET /visits.json
  def index
    @visits = Visit.all
  end

  # GET /visits/1
  # GET /visits/1.json
  def show
  end

  # GET /visits/new
  def new
    @visit = Visit.new
    if params[:exhibition_id] && Exhibition.find(params[:exhibition_id])
      @visit.exhibition_id = params[:exhibition_id]
    end
  end

  # GET /visits/1/edit
  def edit
  end

  # POST /visits
  # POST /visits.json
  def create
    @visit = Visit.new(visit_params)
    if Exhibition.find(@visit.exhibition_id).user!=current_user
      flash[:notice] = "Vous etes l'organisateur de cette exposition"
      redirect_to root_path
    end
    respond_to do |format|
      if @visit.save
        format.html { redirect_to @visit, notice: 'Visit was successfully created.' }
        format.json { render :show, status: :created, location: @visit }
      else
        format.html { render :new }
        format.json { render json: @visit.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /visits/1
  # PATCH/PUT /visits/1.json
  def update
    respond_to do |format|
      if @visit.update(visit_params)
        format.html { redirect_to @visit, notice: 'Visit was successfully updated.' }
        format.json { render :show, status: :ok, location: @visit }
      else
        format.html { render :edit }
        format.json { render json: @visit.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /visits/1
  # DELETE /visits/1.json
  def destroy
    @visit.destroy
    respond_to do |format|
      format.html { redirect_to visits_url, notice: 'Visit was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_visit
      @visit = Visit.find(params[:id])
    end

    def set_authenticate_user
      if !current_user
        flash[:notice] = "Login before create a visit"
        redirect_to root_path
      end
    end

    def set_owner_user
      if @visit.user.id != current_user.id
        flash[:notice] = "The current user is not the owner of this object"
        redirect_to root_path
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def visit_params
      params.require(:visit).permit(:coming_at, :duration, :exhibition_id)
    end
end
