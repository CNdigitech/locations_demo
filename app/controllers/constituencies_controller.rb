class ConstituenciesController < ApplicationController
  before_action :set_constituency, only: %i[ show edit update destroy ]
  require 'csv'

  # GET /constituencies or /constituencies.json
  def index
    @constituencies = Constituency.all
  end

  #  cascading dropdowns
  def region_district_con
    region_id = params["region_id"]
    logger.info "Displaying region id from form ==== #{region_id.inspect}"
    district = DistrictMaster.where(region_id: region_id)
    @district_select_con = district.map{|a|[a.name, a.district_id]}.insert(0,"")
    logger.info "I am inside constituencies and this is my value : #{@district_select_con.inspect}"
  end

  # GET /constituencies/1 or /constituencies/1.json
  def show
  end

  # uploads =====
  def constituency_sample_csv
    send_file("#{Rails.root}/public/sample_con_csv.csv", filename: "sample_con_csv.csv", type: "application/csv")
  end

  def constituency_upload_form
    @constituency = Constituency.new
  end

  def constituency_bulk_upload
    file_path = constituency_params[:file]

    logger.info "THIS IS THE FILE DATA  #{file_path.inspect} "
    Constituency.bulk_import(file_path)

    respond_to do |format|
      format.html { redirect_to constituencies_path, notice: 'Constituencies were successfully created.' }
      format.json { render :show, status: :created, location: @constituency }
    end
  end

  # GET /constituencies/new
  def new
    @constituency = Constituency.new
    @regions = RegionMaster.where("active_status=true")
    @districts = DistrictMaster.where("active_status=true AND id = ?",0)
  end

  # GET /constituencies/1/edit
  def edit
    @regions = RegionMaster.all
    @districts = DistrictMaster.all

    @constituency = Constituency.where("constituency_id = ? AND active_status = true",@constituency).first
    district_id = @constituency.district_id
    @district = DistrictMaster.where("district_id = ? AND active_status = true",district_id).first
    region_id = @constituency.region_id
    @region = RegionMaster.where("region_id = ? AND active_status = true",region_id).first
  end

  # POST /constituencies or /constituencies.json
  def create
    @constituency = Constituency.new(constituency_params)
    region_id = @constituency.region_id
    region = RegionMaster.where("region_id=? AND active_status=true",region_id).first
    region_code = region.region_code
    @constituency.constituency_id = Constituency.gen_assigned_code(region_code)

    respond_to do |format|
      if @constituency.save
        format.html { redirect_to @constituency, notice: "Constituency was successfully created." }
        format.json { render :show, status: :created, location: @constituency }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @constituency.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /constituencies/1 or /constituencies/1.json
  def update
    @regions = RegionMaster.all
    @districts = DistrictMaster.all
    respond_to do |format|
      if @constituency.update(constituency_params)
        format.html { redirect_to @constituency, notice: "Constituency was successfully updated." }
        format.json { render :show, status: :ok, location: @constituency }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @constituency.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /constituencies/1 or /constituencies/1.json
  def destroy
    @constituency.destroy
    respond_to do |format|
      format.html { redirect_to constituencies_url, notice: "Constituency was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_constituency
      @constituency = Constituency.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def constituency_params
      params.require(:constituency).permit(:file, :region_id, :constituency_id, :district_id, :name, :ec_constituency_code, :registered_voters, :active_status, :del_status)
    end
end
