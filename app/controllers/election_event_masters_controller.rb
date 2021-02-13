class ElectionEventMastersController < ApplicationController
  before_action :set_election_event_master, only: %i[ show edit update destroy ]

  # GET /election_event_masters or /election_event_masters.json
  def index
    @election_event_masters = ElectionEventMaster.all
  end

  # GET /election_event_masters/1 or /election_event_masters/1.json
  def show
  end

  # GET /election_event_masters/new
  def new
    @election_event_master = ElectionEventMaster.new
    @election_event_master.election_event_locations.build
    @election_types = [["General Election","GEN"],["By Election","BYE"]]
    @regions = RegionMaster.where("active_status=true")
    @districts = DistrictMaster.where("active_status=true AND id = ?",0)
    @constituencies = Constituency.where("active_status=true AND id = ?",0)
  end

  def event_region_data

  end

  def event_region_modal
    @regions = RegionMaster.where("active_status=true")
  end

  # GET /election_event_masters/1/edit
  def edit
  end

  # POST /election_event_masters or /election_event_masters.json
  def create
    @election_event_master = ElectionEventMaster.new(election_event_master_params)

    respond_to do |format|
      if @election_event_master.save
        format.html { redirect_to @election_event_master, notice: "Election event master was successfully created." }
        format.json { render :show, status: :created, location: @election_event_master }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @election_event_master.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /election_event_masters/1 or /election_event_masters/1.json
  def update
    respond_to do |format|
      if @election_event_master.update(election_event_master_params)
        format.html { redirect_to @election_event_master, notice: "Election event master was successfully updated." }
        format.json { render :show, status: :ok, location: @election_event_master }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @election_event_master.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /election_event_masters/1 or /election_event_masters/1.json
  def destroy
    @election_event_master.destroy
    respond_to do |format|
      format.html { redirect_to election_event_masters_url, notice: "Election event master was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_election_event_master
      @election_event_master = ElectionEventMaster.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def election_event_master_params
      params.require(:election_event_master).permit(:election_event_id, :event_name, :election_type, :election_date, :notes, 
                                                    :ec_election_reference, :active_status, :del_status, :user_id,
                                                    election_event_locations_attributes: [:id, :election_event_id, :region_id, :district_id, :constituency_id])
    end
end
