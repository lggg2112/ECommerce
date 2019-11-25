# frozen_string_literal: true

class Product < ApplicationRecord
  belongs_to :brand
  belongs_to :category

  validates :name, :price, presence: true

  has_one_attached :image

  paginates_per 4
end
