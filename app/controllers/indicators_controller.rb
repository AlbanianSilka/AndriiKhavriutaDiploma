class IndicatorsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_indicator, only: %i[ show edit update destroy ]

  def index
    @indicators = Indicator.all
  end

  def show; end

  def new
    @indicator = Indicator.new
  end

  def create
    @indicator = Indicator.new(indicator_params)

    respond_to do |format|
      if @indicator.save
        format.html { redirect_to indicator_url(@indicator), notice: "Indicator was successfully created." }
        format.json { render :show, status: :created, location: @indicator }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @indicator.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @indicator.update(indicator_params)
        format.html { redirect_to indicator_url(@indicator), notice: "Indicator was successfully updated." }
        format.json { render :show, status: :ok, location: @indicator }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @indicator.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @indicator.destroy

    respond_to do |format|
      format.html { redirect_to indicators_url, notice: "Indicator was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  def set_indicator
    @indicator = Indicator.find(params[:id])
  end

  def indicator_params
    params.require(:indicator).permit(:values, :mechanism_id, :x_value, :y_value)
  end
end
