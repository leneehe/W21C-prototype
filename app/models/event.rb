class Event < ApplicationRecord
  belongs_to :event_type
  belongs_to :user
  has_many :checklists
end
