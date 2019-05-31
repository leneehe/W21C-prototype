class Checklist < ApplicationRecord
  belongs_to :event

  scope :incomplete, -> { where('complete = false') }
  scope :complete, -> { where('complete = true') }
end
