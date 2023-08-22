class VariantsController < ApplicationController
  before_action :set_variant, only: %i[ show edit update destroy ]

  # GET /variants or /variants.json
  def index
    @variants = Variant.all
  end

  # GET /variants/1 or /variants/1.json
  def show
  end

  # GET /variants/new
  def new

    @pro = Product.find(params[:format])
    @attributes = ProductAtribute.where(product_id: @pro.id) || []
    selected_atrs = Atribute.includes(:atr_values).where(id: @attributes.pluck(:atribute_id)).all

    @combinations = generate_all_combinations(selected_atrs)

    @atrs = Atribute.all



    @variant = Variant.new
    @variant.variant_atr_values.build

  end

  # GET /variants/1/edit
  def edit
  end

  # POST /variants or /variants.json
  def create
    @variant = Variant.new(variant_params)

    debugger
    respond_to do |format|
      if @variant.save


        format.html { redirect_to variant_url(@variant), notice: "Variant was successfully created." }
        format.json { render :show, status: :created, location: @variant }
      else
        format.html { render :new, @combinations => @combinations, status: :unprocessable_entity }
        format.json { render json: @variant.errors, status: :unprocessable_entity }
      end
    end
  end


  # PATCH/PUT /variants/1 or /variants/1.json
  def update
    respond_to do |format|
      if @variant.update(variant_params)
        format.html { redirect_to variant_url(@variant), notice: "Variant was successfully updated." }
        format.json { render :index, status: :ok, location: @variant }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @variant.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /variants/1 or /variants/1.json
  def destroy
    @variant.destroy

    respond_to do |format|
      format.html { redirect_to variants_url, notice: "Variant was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_variant
      @variant = Variant.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def variant_params
      params.require(:variant).permit(:price, :stock, :product_id,variant_atr_values_attributes: [ :id, :atr_value_id])
    end

  def generate_all_combinations(atrs)
    combinations = [[]]

    atrs.each do |atr|
      atr_values = atr.atr_values.map(&:value)
      new_combinations = []

      combinations.each do |combination|
        atr_values.each do |atr_value|
          new_combinations << combination + [atr_value]
        end
      end

      combinations = new_combinations
    end

    combinations
  end


end



# variant_atr_values_params = params[:variant][:variant_atr_values_attributes]
# if variant_atr_values_params.present?
#   atr_value_ids = variant_atr_values_params.values.map { |attrs| attrs[:atr_value_id] }.flatten
#
#   atr_value_ids.each do |atr_value_id|
#     @variant.variant_atr_values.create(atr_value_id: atr_value_id)
#   end
# end




# variant_atr_values_params = params[:variant_atr_values_attributes]
#
# if variant_atr_values_params.present?
#   variant_atr_values_params.each do |key, value|
#     atr_value_ids = value[:atr_value_id].split(' ').map(&:to_i)
#
#     atr_value_ids.each do |atr_value_id|
#       @variant.variant_atr_values.build(atr_value_id: atr_value_id)
#     end
#   end
#   @variant.save # Save the variant with associated records
# end