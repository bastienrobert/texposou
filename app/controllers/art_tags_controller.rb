class ArtTagsController < ApplicationController
  before_action :set_art_tag, only: [:show, :edit, :update, :destroy]

  # GET /art_tags
  # GET /art_tags.json
  def index
    @art_tags = ArtTag.all
  end

  # GET /art_tags/1
  # GET /art_tags/1.json
  def show
  end

  # GET /art_tags/new
  def new
    @art_tag = ArtTag.new
  end

  # GET /art_tags/1/edit
  def edit
  end

  # POST /art_tags
  # POST /art_tags.json
  def create
    @art_tag = ArtTag.new(art_tag_params)

    respond_to do |format|
      if @art_tag.save
        format.html { redirect_to @art_tag, notice: 'Art tag was successfully created.' }
        format.json { render :show, status: :created, location: @art_tag }
      else
        format.html { render :new }
        format.json { render json: @art_tag.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /art_tags/1
  # PATCH/PUT /art_tags/1.json
  def update
    respond_to do |format|
      if @art_tag.update(art_tag_params)
        format.html { redirect_to @art_tag, notice: 'Art tag was successfully updated.' }
        format.json { render :show, status: :ok, location: @art_tag }
      else
        format.html { render :edit }
        format.json { render json: @art_tag.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /art_tags/1
  # DELETE /art_tags/1.json
  def destroy
    @art_tag.destroy
    respond_to do |format|
      format.html { redirect_to art_tags_url, notice: 'Art tag was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_art_tag
      @art_tag = ArtTag.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def art_tag_params
      params.fetch(:art_tag, {})
    end
end
