class TownMastersController < ApplicationController
  before_action :set_town_master, only: %i[ show edit update destroy ]

  # GET /town_masters or /town_masters.json
  def index
    @town_masters = TownMaster.all
  end

  # GET /town_masters/1 or /town_masters/1.json
  def show
  end

  # GET /town_masters/new
  def new
    @town_master = TownMaster.new
    @regions = RegionMaster.all
    @districts = DistrictMaster.where("id = ?",0)
  end

   # Cascading select
  def region_district
    region_id = params["region_id"]
    logger.info "Displaying region id from form ==== #{region_id.inspect}"
    district = DistrictMaster.where(region_id: region_id)
    @district_select = district.map{|a|[a.name, a.district_id]}.insert(0,"")
    logger.info "I am here and this is what I carry : #{@district_select.inspect}"
  end

  # GET /town_masters/1/edit
  def edit
    @regions = RegionMaster.all
    @districts = DistrictMaster.all

    @town = TownMaster.where("town_id = ? AND active_status = true",@town_master).first
    district_id = @town.district_id
    @district = DistrictMaster.where("district_id = ? AND active_status = true",district_id).first
    region_id = @district.region_id
    @region = RegionMaster.where("region_id = ? AND active_status = true",region_id).first
  end

  # POST /town_masters or /town_masters.json
  def create
    @regions = RegionMaster.all
    @districts = DistrictMaster.all

    @town_master = TownMaster.new(town_master_params)
    prefix = @town_master.name
    @town_master.town_id = TownMaster.gen_assigned_code(prefix)
    town_idd = @town_master.town_id

    respond_to do |format|
      if @town_master.save
        format.html { redirect_to @town_master, notice: "Town master was successfully created." }
        format.json { render :show, status: :created, location: @town_master }
      else
        logger.info "Here ===== #{@town_master.errors.messages.inspect}"
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @town_master.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /town_masters/1 or /town_masters/1.json
  def update
    @regions = RegionMaster.all
    @districts = DistrictMaster.all
    
    respond_to do |format|
      if @town_master.update(town_master_params)
        format.html { redirect_to @town_master, notice: "Town master was successfully updated." }
        format.json { render :show, status: :ok, location: @town_master }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @town_master.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /town_masters/1 or /town_masters/1.json
  def destroy
    @town_master.destroy
    respond_to do |format|
      format.html { redirect_to town_masters_url, notice: "Town master was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_town_master
      @town_master = TownMaster.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def town_master_params
      params.require(:town_master).permit(:region_id, :town_id, :district_id, :name, :town_center_gps, :active_status, :del_status)
    end
end
