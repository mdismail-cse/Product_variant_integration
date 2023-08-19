class AtributesController < ApplicationController
  before_action :set_atribute, only: %i[ show edit update destroy ]

  # GET /atributes or /atributes.json
  def index
    @atributes = Atribute.all
  end

  # GET /atributes/1 or /atributes/1.json
  def show
  end

  # GET /atributes/new
  def new
    @atribute = Atribute.new
    @atribute.atr_values.build
  end

  # GET /atributes/1/edit
  def edit
  end

  # POST /atributes or /atributes.json
  def create

    @atribute = Atribute.new(atribute_params)
    debugger
    respond_to do |format|
      if @atribute.save
        format.html { redirect_to atribute_url(@atribute), notice: "Atribute was successfully created." }
        format.json { render :show, status: :created, location: @atribute }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @atribute.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /atributes/1 or /atributes/1.json
  def update
    respond_to do |format|
      if @atribute.update(atribute_params)
        format.html { redirect_to atribute_url(@atribute), notice: "Atribute was successfully updated." }
        format.json { render :show, status: :ok, location: @atribute }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @atribute.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /atributes/1 or /atributes/1.json
  def destroy
    @atribute.destroy

    respond_to do |format|
      format.html { redirect_to atributes_url, notice: "Atribute was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_atribute
      @atribute = Atribute.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def atribute_params
      params.require(:atribute).permit(:title, atr_values_attributes:[:id , :value])
    end
end
