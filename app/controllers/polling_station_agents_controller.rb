class PollingStationAgentsController < ApplicationController
  before_action :set_polling_station_agent, only: %i[ show edit update destroy ]
  include AssignedCodeGenerator
  # GET /polling_station_agents or /polling_station_agents.json
  def index
    @polling_station_agents = PollingStationAgent.all
  end

  # GET /polling_station_agents/1 or /polling_station_agents/1.json
  def show
  end

  #  cascading dropdowns
  def region_constituency_pa
    region_id = params["region_id"]
    logger.info "Displaying region_id from form ==== #{region_id.inspect}"
    constituency = Constituency.where(region_id: region_id)
    polling_station = PollingStationMaster.where(region_id: region_id)
    @constituency_select = constituency.map{|a|[a.name, a.constituency_id]}.insert(0,"")
    @poll_station_select = polling_station.map{|a|[a.name, a.polling_station_id]}.insert(0,"")
    logger.info "Polling Agent constituencies : #{@constituency_select.inspect} AND polling stations : #{@poll_station_select.inspect}"
  end

  # GET /polling_station_agents/new
  def new
    @polling_station_agent = PollingStationAgent.new
    @parties = PoliticalPartyMaster.where("active_status = true")
    @regions = RegionMaster.where("active_status = true")
    @constituencies = Constituency.where("active_status = true AND id=?",0)
    @polling_stations = PollingStationMaster.where("active_status = true AND id=?",0)
    @towns = TownMaster.all
    @titles = [["Mr", "Mr"],["Mrs","Mrs"],["Ms","Ms"],["Dr","Dr"]]   
    @genders = [["Female", "F"],["Male","M"],["Other","O"]]
  end

  # GET /polling_station_agents/1/edit
  def edit
    @parties = PoliticalPartyMaster.where("active_status = true")
    @regions = RegionMaster.all
    @constituencies = Constituency.all
    @polling_stations = PollingStationMaster.all
    @towns = TownMaster.all
    @titles = [["Mr", "Mr"],["Mrs","Mrs"],["Ms","Ms"],["Dr","Dr"]]   
    @genders = [["Female", "F"],["Male","M"],["Other","O"]]
  end

  # POST /polling_station_agents or /polling_station_agents.json
  def create
    @polling_station_agent = PollingStationAgent.new(polling_station_agent_params)
    @polling_station_agent.agent_id = AssignedCodeGenerator.gen_assigned_code("polling_agent_seq", "PSA")
    unless Rails.env.test?
      unless  polling_station_agent_params[:agent_photo].nil? ||  polling_station_agent_params[:agent_signature_image].nil?
        path = polling_station_agent_params[:agent_photo].tempfile.path
        path2 = polling_station_agent_params[:agent_signature_image].tempfile.path

        ImageProcessing::MiniMagick.source(path)
        ImageProcessing::MiniMagick.source(path2)
          .resize_to_limit(200, 200)
          .call(destination: path)
      end
    end
    respond_to do |format|
      if @polling_station_agent.save
        format.html { redirect_to @polling_station_agent, notice: "Polling station agent was successfully created." }
        format.json { render :show, status: :created, location: @polling_station_agent }
      else
        logger.info "POLLING AGENT ERRORS === #{ @polling_station_agent.errors.messages.inspect}"
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @polling_station_agent.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /polling_station_agents/1 or /polling_station_agents/1.json
  def update
    respond_to do |format|
      if @polling_station_agent.update(polling_station_agent_params)
        format.html { redirect_to @polling_station_agent, notice: "Polling station agent was successfully updated." }
        format.json { render :show, status: :ok, location: @polling_station_agent }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @polling_station_agent.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /polling_station_agents/1 or /polling_station_agents/1.json
  def destroy
    @polling_station_agent.destroy
    respond_to do |format|
      format.html { redirect_to polling_station_agents_url, notice: "Polling station agent was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_polling_station_agent
      @polling_station_agent = PollingStationAgent.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def polling_station_agent_params
      params.require(:polling_station_agent).permit(:agent_id, :political_party_id, :region_id, :constituency_id, :polling_station_id, :title, :firstname, :lastname, :gender_id, :agent_photo, :image_path, :agent_signature_image, :phone_number, :email_address, :hq_address_line_1, :hq_address_line_2, :city, :town_id, :gps_coordinates, :nearest_landmark, :active_status, :del_status, :user_id)
    end
end
