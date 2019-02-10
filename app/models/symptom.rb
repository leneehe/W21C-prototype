class Symptom < ApplicationRecord
  has_many :tracked_symptoms
  has_many :value_types
  belongs_to :user
  
  accepts_nested_attributes_for :tracked_symptoms
  accepts_nested_attributes_for :value_types
end
