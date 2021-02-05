class DistrictMastersController < ApplicationController
  before_action :set_district_master, only: %i[ show edit update destroy ]

  # GET /district_masters or /district_masters.json
  def index
    @district_masters = DistrictMaster.all
  end

  # GET /district_masters/1 or /district_masters/1.json
  def show
  end

  # GET /district_masters/new
  def new
    @district_master = DistrictMaster.new
    @regions = RegionMaster.all
    @district_types = DistrictTypeMaster.all
  end

  # GET /district_masters/1/edit
  def edit
    @regions = RegionMaster.all
    @district_types = DistrictTypeMaster.all
  end

  # POST /district_masters or /district_masters.json
  def create
    @district_master = DistrictMaster.new(district_master_params)
    prefix = @district_master.name
    # @district_master.region_code = prefix[0..3].downcase
    @district_master.district_id = DistrictMaster.gen_assigned_code(prefix)

    @regions = RegionMaster.all
    @district_types = DistrictTypeMaster.all
    
    respond_to do |format|
      if @district_master.save
        format.html { redirect_to @district_master, notice: "District master was successfully created." }
        format.json { render :show, status: :created, location: @district_master }
      else
        logger.info "Here now ===== #{@district_master.errors.messages.inspect}"
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @district_master.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /district_masters/1 or /district_masters/1.json
  def update
    @regions = RegionMaster.all
    @district_types = DistrictTypeMaster.all

    respond_to do |format|
      if @district_master.update(district_master_params)
        format.html { redirect_to @district_master, notice: "District master was successfully updated." }
        format.json { render :show, status: :ok, location: @district_master }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @district_master.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /district_masters/1 or /district_masters/1.json
  def destroy
    @district_master.destroy
    respond_to do |format|
      format.html { redirect_to district_masters_url, notice: "District master was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_district_master
      @district_master = DistrictMaster.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def district_master_params
      params.require(:district_master).permit(:district_id, :region_id, :district_type, :name, :capital, :capital_gps, :active_status, :del_status)
    end
end
