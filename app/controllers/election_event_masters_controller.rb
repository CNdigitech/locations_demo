class ElectionEventMastersController < ApplicationController
  before_action :set_election_event_master, only: %i[ show edit update destroy ]
  include AssignedCodeGenerator
  # GET /election_event_masters or /election_event_masters.json
  def index
    @election_event_masters = ElectionEventMaster.all
  end

  def event_region_data
    region_id = params[:region_id]
    @regions = RegionMaster.where("active_status=true")
    logger.info "THE REGION ID are === '#{region_id.inspect}'"
    respond_to do |format|
      format.js
      render 'event_district_modal'
    end
  end

  def event_region_modal
    # @regions = RegionMaster.where("active_status=true")
    # @election_event_master = ElectionEventMaster.new
    @constituencies = Constituency.where("active_status=true")

  end

  def event_constituency_modal
    @region_ids = params[:region_id]
    logger.info "THE CONSTITUENCY IDs are === '#{@region_ids.inspect}'"
  end

  def event_poll_station_modal
    # @constituency_ids = params[:constituency_id]
    @constituency_ids = ElectionEventLocation.where("election_event_id = ?", params[:event_id])
    logger.info "THE POLLING STATION IDs are === '#{@constituency_ids.inspect}'"
  end

  # GET /election_event_masters/1 or /election_event_masters/1.json
  def show
  end

  # GET /election_event_masters/new
  def new
    @con = Constituency.where("active_status=true")
    @election_event_master = ElectionEventMaster.new
    @election_event_master.election_event_locations.build
    @election_types = [["General Election","GEN"],["By Election","BYE"]]
    @regions = RegionMaster.where("active_status=true")
    @districts = DistrictMaster.where("active_status=true AND id = ?",0)
    @constituencies = Constituency.where("active_status=true AND id = ?",0)
  end

  # GET /election_event_masters/1/edit
  def edit
  end

  # POST /election_event_masters or /election_event_masters.json
  def create
    @election_types = [["General Election","GEN"],["By Election","BYE"]]
    @con = Constituency.where("active_status=true")
    @election_event_master = ElectionEventMaster.new(election_event_master_params)
  
    # region = RegionMaster.where("region_id = ?", @election_event_master.region_id)[0]
    # country_code = region.country_code
    @election_event_master.election_event_id = AssignedCodeGenerator.gen_assigned_code("election_event_seq","ELEC")
    # @election_event_master.election_event_id = "#{country_code}" + "ELEC" + "#{event_code}"

    respond_to do |format|
      if @election_event_master.valid?
       
        
        # {a: 1}.key?(:a)
        if params.key?("constituency_ids") 
          logger.info "NOT VALID ============================"
          logger.info "con ids #{params["constituency_ids"].inspect}"
          if params["constituency_ids"]["constituency_id"].empty?
            logger.info "NOT VALID con id id nil ============================"

            format.html { render :new, status: :unprocessable_entity, notice: "Please select constituencies" }
            format.json { render json: @election_event_master.errors, status: :unprocessable_entity }
          else
            logger.info "VALID ============================"

            @election_event_master.save
            params["constituency_ids"][:constituency_id].each do |a|
              logger.info "constituency values = #{a.inspect}"
              @new_election_event_location = ElectionEventLocation.new(election_event_id: @election_event_master.election_event_id,constituency_id: a)
              @new_election_event_location.save(validate: false)
            end
            
            format.html { redirect_to @election_event_master, notice: "Election event master was successfully created." }
            format.json { render :show, status: :created, location: @election_event_master }
          end
        else
          logger.info "NOT VALID conid set not available============================"

          format.html { render :new, status: :unprocessable_entity, notice: "Please select constituencies" }
          flash.now[:danger]="Please select constituencies"
          format.json { render json: @election_event_master.errors, status: :unprocessable_entity }
        end
       

        # format.html { redirect_to @election_event_master, notice: "Election event master was successfully created." }
        # format.json { render :show, status: :created, location: @election_event_master }
      else
        format.html { render :new, status: :unprocessable_entity, notice: "Please select constituencies" }
        format.json { render json: @election_event_master.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /election_event_masters/1 or /election_event_masters/1.json
  def update
    @election_types = [["General Election","GEN"],["By Election","BYE"]]
    @con = Constituency.where("active_status=true")
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
