class Appointment < ApplicationRecord
  belongs_to :brand
  belongs_to :employee
end
