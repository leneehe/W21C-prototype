class Medication < ApplicationRecord
  has_many :tracked_medications
  has_many :users, through: :tracked_medications
end
