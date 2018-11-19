class ValueType < ApplicationRecord
  belongs_to :health_condition
  has_many :tracked_health_conditions
end
