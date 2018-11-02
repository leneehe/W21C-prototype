class HealthCondition < ApplicationRecord
  has_many :tracked_health_conditions
  has_many :users, through: :tracked_health_conditions
end
