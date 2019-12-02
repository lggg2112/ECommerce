# frozen_string_literal: true

class Product < ApplicationRecord
  before_destroy :not_referenced_by_any_line_item
  belongs_to :brand
  belongs_to :category
  has_many :line_items

  validates :name, :price, presence: true

  has_one_attached :image

  paginates_per 4

  def self.search(search)
    where('brand_id LIKE ?', "%#{search}")
  end


  private

  def not_referenced_by_any_line_item
    unless line_items.empty?
      errors.add(:base, 'Line items present')
      throw :abort
    end
  end
end
