class Symptom < ApplicationRecord
  has_many :tracked_symptoms
  
  has_many :symptoms_users
  has_many :users, through: :symptoms_users
  # has_many :users, through: :tracked_symptoms
  has_many :suggested_symptoms
  has_many :conditions, through: :suggested_symptoms

  accepts_nested_attributes_for :tracked_symptoms
  # accepts_nested_attributes_for :symptoms_users

  scope :primary, -> { joins(:suggested_symptoms).where(suggested_symptoms: {primary_condition: true}) }

  scope :supporting, -> { joins(:suggested_symptoms).where(suggested_symptoms: {primary_condition: false}) }
end
