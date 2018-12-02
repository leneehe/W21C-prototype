class Event < ApplicationRecord
  belongs_to :event_type
  belongs_to :user
  has_many :checklists

  def event_type
    EventType.find(self.event_type_id).name
  end
end
