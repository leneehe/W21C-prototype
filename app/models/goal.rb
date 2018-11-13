class Goal < ApplicationRecord
  validates :specific_1, :specific_2, :specific_3, :specific_4, presence: true
  belongs_to :user

  scope :incomplete, -> { where('complete = false') }
  scope :complete, -> { where('complete = true') }
end
