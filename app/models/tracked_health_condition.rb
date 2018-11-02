class TrackedHealthCondition < ApplicationRecord
  belongs_to :user
  belongs_to :health_condition
end
