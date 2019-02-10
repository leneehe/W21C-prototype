class Condition < ApplicationRecord
  has_and_belongs_to_many :users
  has_many :suggested_symptoms
  has_many :symptoms, through: :suggested_symptoms
end
