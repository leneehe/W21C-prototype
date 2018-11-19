class HealthCondition < ApplicationRecord
  has_many :tracked_health_conditions
  has_many :value_types
  belongs_to :user
end
