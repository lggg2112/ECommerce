# frozen_string_literal: true

class StoreController < ApplicationController
  def index; end

  def search
    if params[:search].blank?
      redirect_to(root_path, alert: 'Empty field!') && return
    else
      @results = Category.joins(:products).search(params[:search])
    end
  end
end
