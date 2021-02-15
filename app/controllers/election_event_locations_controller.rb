class ElectionEventLocationsController < ApplicationController
  before_action :set_election_event_location, only: %i[ show edit update destroy ]

  # GET /election_event_locations or /election_event_locations.json
  def index
    @election_event_locations = ElectionEventLocation.all
  end

  # GET /election_event_locations/1 or /election_event_locations/1.json
  def show
  end

  # GET /election_event_locations/new
  def new
    @election_event_location = ElectionEventLocation.new
    @regions = RegionMaster.where("active_status=true")
    @districts = DistrictMaster.where("active_status=true AND id = ?",0)
    @constituencies = Constituency.where("active_status=true AND id = ?",0)
  end

  # GET /election_event_locations/1/edit
  def edit
  end

  # POST /election_event_locations or /election_event_locations.json
  def create
    @election_event_location = ElectionEventLocation.new(election_event_location_params)

    respond_to do |format|
      if @election_event_location.save
        format.html { redirect_to @election_event_location, notice: "Election event location was successfully created." }
        format.json { render :show, status: :created, location: @election_event_location }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @election_event_location.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /election_event_locations/1 or /election_event_locations/1.json
  def update
    respond_to do |format|
      if @election_event_location.update(election_event_location_params)
        format.html { redirect_to @election_event_location, notice: "Election event location was successfully updated." }
        format.json { render :show, status: :ok, location: @election_event_location }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @election_event_location.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /election_event_locations/1 or /election_event_locations/1.json
  def destroy
    @election_event_location.destroy
    respond_to do |format|
      format.html { redirect_to election_event_locations_url, notice: "Election event location was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_election_event_location
      @election_event_location = ElectionEventLocation.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def election_event_location_params
      params.require(:election_event_location).permit(:assigned_code, :election_event_id, :region_id, :district_id, :constituency_id, :polling_station_id)
    end
end
