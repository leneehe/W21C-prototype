class Medication < ApplicationRecord
  has_many :tracked_medications
  has_many :users, through: :tracked_medications

  accepts_nested_attributes_for :tracked_medications, allow_destroy: true
end
