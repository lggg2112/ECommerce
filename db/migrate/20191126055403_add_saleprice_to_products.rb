# frozen_string_literal: true

class AddSalepriceToProducts < ActiveRecord::Migration[6.0]
  def change
    add_column :products, :saleprice, :decimal
  end
end
