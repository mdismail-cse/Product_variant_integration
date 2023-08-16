class AtrValuesController < ApplicationController
  before_action :set_atr_value, only: %i[ show edit update destroy ]

  # GET /atr_values or /atr_values.json
  def index
    @atr_values = AtrValue.all
  end

  # GET /atr_values/1 or /atr_values/1.json
  def show
  end

  # GET /atr_values/new
  def new
    @atr_value = AtrValue.new
  end

  # GET /atr_values/1/edit
  def edit
  end

  # POST /atr_values or /atr_values.json
  def create
    @atr_value = AtrValue.new(atr_value_params)

    respond_to do |format|
      if @atr_value.save
        format.html { redirect_to atr_value_url(@atr_value), notice: "Atr value was successfully created." }
        format.json { render :show, status: :created, location: @atr_value }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @atr_value.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /atr_values/1 or /atr_values/1.json
  def update
    respond_to do |format|
      if @atr_value.update(atr_value_params)
        format.html { redirect_to atr_value_url(@atr_value), notice: "Atr value was successfully updated." }
        format.json { render :show, status: :ok, location: @atr_value }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @atr_value.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /atr_values/1 or /atr_values/1.json
  def destroy
    @atr_value.destroy

    respond_to do |format|
      format.html { redirect_to atr_values_url, notice: "Atr value was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_atr_value
      @atr_value = AtrValue.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def atr_value_params
      params.require(:atr_value).permit(:value, :atribute_id)
    end
end
