# frozen_string_literal: true

class Brand < ApplicationRecord
  has_many :products

  validates :name, :address, :email, :contact_number, presence: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }

  has_one_attached :image

  def self.search(search)
    where('lower(products.name) LIKE :search OR lower(brands.name) LIKE :search', search: "%#{search.downcase}%").uniq
  end

end
