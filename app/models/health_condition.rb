class HealthCondition < ApplicationRecord
  has_many :tracked_health_conditions
  has_many :value_types
  belongs_to :user
  
  accepts_nested_attributes_for :tracked_health_conditions
  accepts_nested_attributes_for :value_types
end
