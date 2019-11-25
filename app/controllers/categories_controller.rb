# frozen_string_literal: true

class CategoriesController < ApplicationController
  def index
    @categories = Categoty.all
  end

  def show
    @category = Category.find(params[:id])
  end
end
