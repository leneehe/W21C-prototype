class HealthCondition < ApplicationRecord
  has_many :tracked_health_conditions
  has_many :value_types
  belongs_to :user

  accepts_nested_attributes_for :value_types, :reject_if => :all_blank,
	:allow_destroy => true
end
