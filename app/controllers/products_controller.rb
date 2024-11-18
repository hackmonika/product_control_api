class ProductsController < ApplicationController
  before_action :set_product, only: %i[ show update destroy ]

  # GET /products
  def index
    @products = Product.order(updated_at: :desc).map do |product|
    {
      id: product.id,
      name: product.name,
      price: product.price,
      stock_quantity: product.stock_quantity,
      description: product.description,
      image_url: product.image.attached? ? url_for(product.image) : nil
    }
  end

    render json: @products
  end

  # GET /products/1
  def show
    render json: @product
  end

  # POST /products
  def create
    @product = Product.new(product_params)

    if @product.save
      render json: @product, status: :created, location: @product
    else
      render json: @product.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /products/1
  def update
    if @product.update(product_params)
      render json: @product
    else
      render json: @product.errors, status: :unprocessable_entity
    end
  end

  # DELETE /products/1
  def destroy
    @product.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def product_params
      params.expect(product: [ :name, :price, :stock_quantity, :description, :image ])
    end
end
