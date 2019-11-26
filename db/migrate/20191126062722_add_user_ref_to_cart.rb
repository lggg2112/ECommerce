# frozen_string_literal: true

class AddUserRefToCart < ActiveRecord::Migration[6.0]
  def change
    add_reference :carts, :user, foreign_key: true
  end
end
