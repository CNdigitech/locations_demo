class RegionMastersController < ApplicationController
  before_action :set_region_master, only: %i[ show edit update destroy ]

  # GET /region_masters or /region_masters.json
  def index
    @region_masters = RegionMaster.all
  end

  # GET /region_masters/1 or /region_masters/1.json
  def show
  end

  # GET /region_masters/new
  def new
    @region_master = RegionMaster.new
    @countries = CountryMaster.all
  end

  # GET /region_masters/1/edit
  def edit
    @countries = CountryMaster.all
  end

  # POST /region_masters or /region_masters.json
  def create
    @countries = CountryMaster.all

    @region_master = RegionMaster.new(region_master_params)
    c_code = @region_master.country_code
    prefix = @region_master.name
    @region_master.region_code = prefix[0..3].downcase
    @region_master.region_id = RegionMaster.gen_assigned_code(c_code,prefix)

    respond_to do |format|
      if @region_master.save
        format.html { redirect_to @region_master, notice: "Region master was successfully created." }
        format.json { render :show, status: :created, location: @region_master }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @region_master.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /region_masters/1 or /region_masters/1.json
  def update
    @countries = CountryMaster.all

    respond_to do |format|
      if @region_master.update(region_master_params)
        format.html { redirect_to @region_master, notice: "Region master was successfully updated." }
        format.json { render :show, status: :ok, location: @region_master }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @region_master.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /region_masters/1 or /region_masters/1.json
  def destroy
    @region_master.destroy
    respond_to do |format|
      format.html { redirect_to region_masters_url, notice: "Region master was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_region_master
      @region_master = RegionMaster.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def region_master_params
      params.require(:region_master).permit(:country_code, :region_id, :region_code, :name, :capital, :capital_gps, :active_status, :del_status)
    end
end
