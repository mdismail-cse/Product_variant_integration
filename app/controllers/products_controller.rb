class ProductsController < ApplicationController
  before_action :set_product, only: %i[ show edit update destroy ]

  # GET /products or /products.json
  def index
    @products = Product.all
  end

  # GET /products/1 or /products/1.json
  def show
  end

  # GET /products/new
  def new
    @product = Product.new
    @product.product_atributes.build
    # product_attribute.atribute_ids = []

  end

  # GET /products/1/edit
  def edit
  end

  # POST /products or /products.json
  def create
    @product = Product.new(product_params)
    # debugger
    respond_to do |format|
      if @product.save

        product_attribute_params = params[:product][:product_atributes_attributes]
        if product_attribute_params.present?
          atribute_ids = product_attribute_params.values.map { |attrs| attrs[:atribute_id] }.flatten

          atribute_ids.each do |atribute_id|
            @product.product_atributes.create(atribute_id: atribute_id)
          end
        end

        format.html { redirect_to new_variant_url(@product), notice: "Product was successfully created." }
        # format.json { render :'variants/new', status: :created, location: @product }

      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end



  end

  # PATCH/PUT /products/1 or /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to product_url(@product), notice: "Product was successfully updated." }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1 or /products/1.json
  def destroy
    @product.destroy

    respond_to do |format|
      format.html { redirect_to products_url, notice: "Product was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def product_params
      params.require(:product).permit(:name, :details, variant_atr_values_attributes: [:atr_value_id])
    end
end
