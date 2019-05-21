class SymptomsUser < ApplicationRecord
  validates :normal_range_upper, :normal_range_lower, :assistance_threshold, presence: true
  validates :normal_range_upper, :normal_range_lower, :assistance_threshold, numericality: true
  validates :above_assistance, inclusion: { in: [true, false] }
  belongs_to :user
  belongs_to :symptom

  def find_name
    Symptom.find(self.symptom_id).name
  end
end
