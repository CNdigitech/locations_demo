class CountryMastersController < ApplicationController
  before_action :set_country_master, only: %i[ show edit update destroy ]

  # GET /country_masters or /country_masters.json
  def index
    @country_masters = CountryMaster.all
  end

  # GET /country_masters/1 or /country_masters/1.json
  def show
  end

  # GET /country_masters/new
  def new
    @country_master = CountryMaster.new
    @continents = [["Africa","AF"],["America","AM"],["Asia","AS"],["Australia","AU"],["Europe","EU"]]
  end

  # GET /country_masters/1/edit
  def edit
    @continents = [["Africa","Africa"],["America","America"],["Asia","Asia"],["Australia","Australia"],["Europe","Europe"]]
  end

  # POST /country_masters or /country_masters.json
  def create
    @country_master = CountryMaster.new(country_master_params)
    c_name = @country_master.name
    @country_master.assigned_code = c_name[0..1].upcase

    respond_to do |format|
      if @country_master.save
        format.html { redirect_to @country_master, notice: "Country master was successfully created." }
        format.json { render :show, status: :created, location: @country_master }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @country_master.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /country_masters/1 or /country_masters/1.json
  def update
    respond_to do |format|
      if @country_master.update(country_master_params)
        format.html { redirect_to @country_master, notice: "Country master was successfully updated." }
        format.json { render :show, status: :ok, location: @country_master }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @country_master.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /country_masters/1 or /country_masters/1.json
  def destroy
    @country_master.destroy
    respond_to do |format|
      format.html { redirect_to country_masters_url, notice: "Country master was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_country_master
      @country_master = CountryMaster.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def country_master_params
      params.require(:country_master).permit(:continent_code, :assigned_code, :name, :active_status, :del_status)
    end
end
