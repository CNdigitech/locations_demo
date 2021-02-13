class PollingStationMastersController < ApplicationController
  before_action :set_polling_station_master, only: %i[ show edit update destroy ]
  include AssignedCodeGenerator
  # GET /polling_station_masters or /polling_station_masters.json
  def index
    @polling_station_masters = PollingStationMaster.all
  end

  # GET /polling_station_masters/1 or /polling_station_masters/1.json
  def show
  end

  # GET /polling_station_masters/new
  def new
    @polling_station_master = PollingStationMaster.new
    @regions = RegionMaster.where("active_status=true")
    @districts = DistrictMaster.where("active_status = true AND id=?",0)
    @constituencies = Constituency.where("active_status = true AND id=?",0)
  end

  #  cascading dropdowns
  def region_constituency_ps
    region_id = params["region_id"]
    logger.info "Displaying region_id from form ==== #{region_id.inspect}"
    constituency = Constituency.where(region_id: region_id)
    @constituency_select = constituency.map{|a|[a.name, a.constituency_id]}.insert(0,"")
    logger.info "I am inside polling station and this is my value for constituencies : #{@constituency_select.inspect}"
  end

  # GET /polling_station_masters/1/edit
  def edit
    @regions = RegionMaster.where("active_status = true")
    @districts = DistrictMaster.where("active_status = true")
    @constituencies = Constituency.where("active_status = true")
  end

  # POST /polling_station_masters or /polling_station_masters.json
  def create
    @polling_station_master = PollingStationMaster.new(polling_station_master_params)
    @polling_station_master.polling_station_id = AssignedCodeGenerator.gen_assigned_code('polling_station_seq','POL')
    respond_to do |format|
      if @polling_station_master.save
        format.html { redirect_to @polling_station_master, notice: "Polling station master was successfully created." }
        format.json { render :show, status: :created, location: @polling_station_master }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @polling_station_master.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /polling_station_masters/1 or /polling_station_masters/1.json
  def update
    respond_to do |format|
      if @polling_station_master.update(polling_station_master_params)
        format.html { redirect_to @polling_station_master, notice: "Polling station master was successfully updated." }
        format.json { render :show, status: :ok, location: @polling_station_master }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @polling_station_master.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /polling_station_masters/1 or /polling_station_masters/1.json
  def destroy
    @polling_station_master.destroy
    respond_to do |format|
      format.html { redirect_to polling_station_masters_url, notice: "Polling station master was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_polling_station_master
      @polling_station_master = PollingStationMaster.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def polling_station_master_params
      params.require(:polling_station_master).permit(:polling_station_id, :region_id, :constituency_id, :name, :ec_polling_station_code, :polling_station_gps, :constituency_collation_center, :registered_voters, :active_status, :del_status, :user_id)
    end
end
