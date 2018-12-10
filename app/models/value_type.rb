class ValueType < ApplicationRecord
  belongs_to :health_condition
  has_many :tracked_health_conditions

  before_validation :default_amount

  def default_amount
    if (self.name.blank?)
      self.name = "Value"
    end
  end
end
