class NotAmsController < ApplicationController
  include CheckPattern
  before_action :set_not_am, only: [:show, :edit, :update, :destroy]

  # GET /not_ams
  # GET /not_ams.json
  def index
    @not_ams = NotAm.all
  end

  # GET /not_ams/1
  # GET /not_ams/1.json
  def show
  end

  # GET /not_ams/new
  def new
    @not_am = NotAm.new
  end

  # GET /not_ams/1/edit
  def edit
  end

  # POST /not_ams
  # POST /not_ams.json
  def create
   format_pattern(params[:not_am][:notam_data])
   render :index
  end

  # PATCH/PUT /not_ams/1
  # PATCH/PUT /not_ams/1.json
  def update
    respond_to do |format|
      if @not_am.update(not_am_params)
        format.html { redirect_to @not_am, notice: 'Not am was successfully updated.' }
        format.json { render :show, status: :ok, location: @not_am }
      else
        format.html { render :edit }
        format.json { render json: @not_am.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /not_ams/1
  # DELETE /not_ams/1.json
  def destroy
    @not_am.destroy
    respond_to do |format|
      format.html { redirect_to not_ams_url, notice: 'Not am was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_not_am
    @not_am = NotAm.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def not_am_params
    params.require(:not_am).permit(:notam_data, :text)
  end
end
