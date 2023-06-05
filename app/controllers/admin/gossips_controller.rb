module Admin
  class GossipsController < ApplicationController
    before_action :set_gossip, only: %i[ show edit update destroy ]

    # GET /admin/gossips or /admin/gossips.json
    def index
      @gossips = Gossip.all
    end

    # GET /admin/gossips/1 or /admin/gossips/1.json
    def show
    end

    # GET /admin/gossips/new
    def new
      @gossip = Gossip.new
    end

    # GET /admin/gossips/1/edit
    def edit
    end

    # POST /admin/gossips or /admin/gossips.json
    def create
      @gossip = Gossip.new(gossip_params)

      respond_to do |format|
        if @gossip.save
          format.html { redirect_to admin_gossip_url(@gossip), notice: "Gossip was successfully created." }
          format.json { render :show, status: :created, location: admin_gossip_url(@gossip) }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @gossip.errors, status: :unprocessable_entity }
        end
      end
    end

    # PATCH/PUT /admin/gossips/1 or /admin/gossips/1.json
    def update
      respond_to do |format|
        if @gossip.update(gossip_params)
          format.html { redirect_to admin_gossip_url(@gossip), notice: "Gossip was successfully updated." }
          format.json { render :show, status: :ok, location: admin_gossip_url(@gossip) }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @gossip.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /admin/gossips/1 or /admin/gossips/1.json
    def destroy
      @gossip.destroy

      respond_to do |format|
        format.html { redirect_to admin_gossips_url, notice: "Gossip was successfully destroyed." }
        format.json { head :no_content }
      end
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_gossip
        @gossip = Gossip.find(params[:id])
      end

      # Only allow a list of trusted parameters through.
      def gossip_params
        params.require(:gossip).permit(:title, :content, :user_id)
      end
  end
end
