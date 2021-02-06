class DistrictTypeMastersController < ApplicationController
  before_action :set_district_type_master, only: %i[ show edit update destroy ]
  # include AssignedCodeGenerator

  # GET /district_type_masters or /district_type_masters.json
  def index
    # AssignedCodeGenerator
    @district_type_masters = DistrictTypeMaster.all
  end

  # GET /district_type_masters/1 or /district_type_masters/1.json
  def show
  end

  # GET /district_type_masters/new
  def new
    @district_type_master = DistrictTypeMaster.new
  end

  # GET /district_type_masters/1/edit
  def edit
  end

  # POST /district_type_masters or /district_type_masters.json
  def create
    @district_type_master = DistrictTypeMaster.new(district_type_master_params)

    respond_to do |format|
      if @district_type_master.save
        format.html { redirect_to @district_type_master, notice: "District type master was successfully created." }
        format.json { render :show, status: :created, location: @district_type_master }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @district_type_master.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /district_type_masters/1 or /district_type_masters/1.json
  def update
    respond_to do |format|
      if @district_type_master.update(district_type_master_params)
        format.html { redirect_to @district_type_master, notice: "District type master was successfully updated." }
        format.json { render :show, status: :ok, location: @district_type_master }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @district_type_master.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /district_type_masters/1 or /district_type_masters/1.json
  def destroy
    @district_type_master.destroy
    respond_to do |format|
      format.html { redirect_to district_type_masters_url, notice: "District type master was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_district_type_master
      @district_type_master = DistrictTypeMaster.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def district_type_master_params
      params.require(:district_type_master).permit(:assigned_code, :name)
    end
end
