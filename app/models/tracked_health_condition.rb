class TrackedHealthCondition < ApplicationRecord
  belongs_to :health_condition
  belongs_to :value_type
end
