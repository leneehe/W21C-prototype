class Medication < ApplicationRecord
  has_many :tracked_medications
  has_many :users, through: :tracked_medications

  accepts_nested_attributes_for :tracked_medications, :reject_if => :all_blank, :allow_destroy => true
end
