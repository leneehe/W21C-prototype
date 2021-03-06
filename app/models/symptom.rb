class Symptom < ApplicationRecord
  validates :name, presence: true
  validates_each :symptoms_users do |record, attr, value|
    record.errors.add(attr, "Can't be blank") if value == ''
  end

  has_many :tracked_symptoms

  has_many :symptoms_users
  has_many :users, through: :symptoms_users
  # has_many :users, through: :tracked_symptoms
  has_many :suggested_symptoms
  has_many :conditions, through: :suggested_symptoms

  accepts_nested_attributes_for :tracked_symptoms
  accepts_nested_attributes_for :symptoms_users, :reject_if => :all_blank

  scope :primary, -> { joins(:suggested_symptoms).where(suggested_symptoms: {primary_condition: true}) }

  scope :supporting, -> { joins(:suggested_symptoms).where(suggested_symptoms: {primary_condition: false}) }

  scope :user_tracked, -> (user_id) { joins(:symptoms_users).where(symptoms_users: {user_tracked: true, user_id: user_id}) }
end
