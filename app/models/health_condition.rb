class HealthCondition < ApplicationRecord
  has_many :tracked_health_conditions
  belongs_to :user
end
