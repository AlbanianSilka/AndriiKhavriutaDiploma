class MechanismsController < ApplicationController
  before_action :set_mechanism, only: %i[ show edit update destroy ]

  # GET /mechanisms or /mechanisms.json
  def index
    @mechanisms = Mechanism.all
  end

  # GET /mechanisms/1 or /mechanisms/1.json
  def show
  end

  # GET /mechanisms/new
  def new
    @mechanism = Mechanism.new
  end

  # GET /mechanisms/1/edit
  def edit
  end

  # POST /mechanisms or /mechanisms.json
  def create
    @mechanism = Mechanism.new(mechanism_params)

    respond_to do |format|
      if @mechanism.save
        format.html { redirect_to mechanism_url(@mechanism), notice: "Mechanism was successfully created." }
        format.json { render :show, status: :created, location: @mechanism }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @mechanism.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /mechanisms/1 or /mechanisms/1.json
  def update
    respond_to do |format|
      if @mechanism.update(mechanism_params)
        format.html { redirect_to mechanism_url(@mechanism), notice: "Mechanism was successfully updated." }
        format.json { render :show, status: :ok, location: @mechanism }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @mechanism.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mechanisms/1 or /mechanisms/1.json
  def destroy
    @mechanism.destroy

    respond_to do |format|
      format.html { redirect_to mechanisms_url, notice: "Mechanism was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mechanism
      @mechanism = Mechanism.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def mechanism_params
      params.require(:mechanism).permit(:name, :mechanism_image)
    end
end
