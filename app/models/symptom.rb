class Symptom < ApplicationRecord
  has_many :tracked_symptoms
  has_many :value_types
  # belongs_to :user
  has_and_belongs_to_many :users
  has_many :suggested_symptoms
  has_many :conditions, through: :suggested_symptoms
  
  accepts_nested_attributes_for :tracked_symptoms
  accepts_nested_attributes_for :value_types
end
