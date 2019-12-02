# frozen_string_literal: true

class Employee < ApplicationRecord
  has_many :appointments
  has_many :brands, through: :appointments

  validates :name, :address, :email, :phone, :position, presence: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
end
