class ConstituencyDuplicatesController < ApplicationController
    before_action :set_constituency_duplicate, only: %i[ show edit update destroy ]
    require 'csv'

    def create
        @constituency_duplicate = ConstituencyDuplicate.new(constituency_duplicate_params)
        # region_id = @constituency.region_id
        # region = RegionMaster.where("region_id=? AND active_status=true",region_id).first
        # region_code = region.region_code
        # @constituency.constituency_id = Constituency.gen_assigned_code(region_code)
    
        respond_to do |format|
          if @constituency_duplicate.save
            
            format.html { redirect_to @constituency_duplicate}
            flash.now[:danger] = "Some of your constituencies already exist, they will not be uploaded"
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
          if @constituency_duplicate.update(constituency_duplicate_params)
            format.html { redirect_to @constituency_duplicate, notice: "Constituency was successfully updated." }
            format.json { render :show, status: :ok, location: @constituency }
          else
            format.html { render :edit, status: :unprocessable_entity }
            format.json { render json: @constituency_duplicate.errors, status: :unprocessable_entity }
          end
        end
      end
    
      # DELETE /constituencies/1 or /constituencies/1.json
      def destroy
        @constituency_duplicate.destroy
        respond_to do |format|
          format.html { redirect_to constituencies_url, notice: "Constituency was successfully destroyed." }
          format.json { head :no_content }
        end
      end
    
      private
        # Use callbacks to share common setup or constraints between actions.
        def set_constituency_duplicate
          @constituency_duplicate = ConstituencyDuplicate.find(params[:id])
        end
    
        # Only allow a list of trusted parameters through.
        def constituency_duplicate_params
          params.require(:constituency_duplicate).permit(:region_id, :constituency_id, :district_id, :name, :ec_constituency_code, :registered_voters, :active_status, :del_status)
        end
end
