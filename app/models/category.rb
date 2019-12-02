# frozen_string_literal: true

class Category < ApplicationRecord
  has_many :products

  validates :name, presence: true

  has_one_attached :image

  def self.search(search)
    where('lower(categories.name) LIKE :search OR lower(products.name) LIKE :search', search: "%#{search.downcase}%").uniq
  end
end
