class Symptom < ApplicationRecord
  has_many :tracked_symptoms
  # belongs_to :user
  has_and_belongs_to_many :users
  has_many :users, through: :tracked_symptoms
  has_many :suggested_symptoms
  has_many :conditions, through: :suggested_symptoms

  accepts_nested_attributes_for :tracked_symptoms

  scope :primary, -> { joins(:suggested_symptoms).where(suggested_symptoms: {primary_condition: true}) }

  scope :supporting, -> { joins(:suggested_symptoms).where(suggested_symptoms: {primary_condition: false}) }
end
