class PoliticalPartyMastersController < ApplicationController
  before_action :set_political_party_master, only: %i[ show edit update destroy ]
  require 'mini_magick'
  include AssignedCodeGenerator
  # GET /political_party_masters or /political_party_masters.json
  def index
    @political_party_masters = PoliticalPartyMaster.all
  end

  # GET /political_party_masters/1 or /political_party_masters/1.json
  def show
  end

  # GET /political_party_masters/new
  def new
    @political_party_master = PoliticalPartyMaster.new
    @regions = RegionMaster.where(active_status: true)
    @districts = DistrictMaster.where("active_status = true AND id=?",0)
    @towns = TownMaster.where("active_status = true AND id=?",0)
  end

  #  cascading dropdowns
  def region_district_pp
    region_id = params["region_id"]
    logger.info "Displaying region id from form ==== #{region_id.inspect}"
    district = DistrictMaster.where(region_id: region_id)
    @district_select_pp = district.map{|a|[a.name, a.district_id]}.insert(0,"")
    logger.info "I am inside political parties and this is my value : #{@district_select_pp.inspect}"
  end

  #  cascading dropdowns
  def district_town_pp
    district_id = params["district_id"]
    logger.info "Displaying district_id from form ==== #{district_id.inspect}"
    town = TownMaster.where(district_id: district_id)
    @town_select_pp = town.map{|a|[a.name, a.town_id]}.insert(0,"")
    logger.info "I am inside political parties and this is my value for towns : #{@town_select_pp.inspect}"
  end

  # GET /political_party_masters/1/edit
  def edit
    @regions = RegionMaster.where(active_status: true)
    @districts = DistrictMaster.where(active_status: true)
    @towns = TownMaster.where(active_status: true)
  end

  # POST /political_party_masters or /political_party_masters.json
  def create
    @political_party_master = PoliticalPartyMaster.new(political_party_master_params)
    region = RegionMaster.where("region_id = ?", @political_party_master.region_id).first
    country_code = region.country_code
    code = AssignedCodeGenerator.gen_assigned_code('political_party_seq','PPA')
    @political_party_master.political_party_id = "#{country_code}" + "#{code}"
    @political_party_master.party_initial = PoliticalPartyMaster.get_special_code(@political_party_master.name)

    unless Rails.env.test?
      unless  political_party_master_params[:party_logo].nil? 
        path = political_party_master_params[:party_logo].tempfile.path

        ImageProcessing::MiniMagick.source(path)
          .resize_to_limit(200, 200)
          .call(destination: path)
      end
    end
    
    respond_to do |format|
      if @political_party_master.save
        format.html { redirect_to @political_party_master, notice: "Political party master was successfully created." }
        format.json { render :show, status: :created, location: @political_party_master }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @political_party_master.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /political_party_masters/1 or /political_party_masters/1.json
  def update
    respond_to do |format|
      if @political_party_master.update(political_party_master_params)
        format.html { redirect_to @political_party_master, notice: "Political party master was successfully updated." }
        format.json { render :show, status: :ok, location: @political_party_master }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @political_party_master.errors, status: :unprocessable_entity }
      end
    end
  end

  def delete_image_attachment
    @party_logo = ActiveStorage::Attachment.find_by(id: params[:id])
    @party_logo&.purge
    # @party_logo = ActiveStorage::Blob.find_signed(params[:id])
    logger.info "THE IMAGE = '#{@party_logo.inspect}"
    # @party_logo.purge
    logger.info "================================"
    redirect_to political_party_masters_path, notice: "Upload was successfully removed."
  end
  

  # DELETE /political_party_masters/1 or /political_party_masters/1.json
  def destroy
    @political_party_master.destroy
    respond_to do |format|
      format.html { redirect_to political_party_masters_url, notice: "Political party master was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_political_party_master
      @political_party_master = PoliticalPartyMaster.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def political_party_master_params
      params.require(:political_party_master).permit(:political_party_id, :region_id, :city, :nearest_landmark, :name, :party_initial, :contact_number, :email_address, :party_logo, :image_path, :hq_address_line_1, :hq_address_line_2, :district_id, :town_id, :gps_coordinates, :active_status, :del_status, :user_id)
    end
end
