class ProductsController < ApplicationController
  before_action :set_product, only: %i[description inventory]

  def index
    @products = Product.all
  end

  def description
    render plain: (@product.description || 'no description')
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(strong_params)
    return render :new unless @product.save
    redirect_to products_path
  end

  def inventory
    render plain: (@product.inventory.zero? ? 'false' : 'true')
  end

  private

  def strong_params
    params.require(:product).permit(
      :name,
      :description
    )
  end

  def set_product
    @product = Product.find(params[:id])
  end
end
