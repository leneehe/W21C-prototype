class ValueType < ApplicationRecord
  belongs_to :symptom
  has_many :tracked_symptoms

  before_validation :default_amount

  def default_amount
    if (self.name.blank?)
      self.name = "Value"
    end
  end
end
