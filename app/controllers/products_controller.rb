# frozen_string_literal: true

class ProductsController < ApplicationController
  def index
    @products = if params[:product] && params[:product][:brand_id]
                  Product.search(params[:product][:brand_id])
                elsif params[:product] && params[:product][:category_id]
                  Product.search(params[:product][:category_id])
                else
                  Product.all
                end
  end

  def show
    @product = Product.find(params[:id])
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_product
    @product = Product.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def product_params
    params.require(:product).permit(:name, :description, :price, :image, :size, :color, :brand_id, :category_id)
  end

  def onsale
    @products = Product.where('pricesale > ?', 0)
  end

  def new; end

  def updated; end
end
