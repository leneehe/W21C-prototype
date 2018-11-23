class TrackedMedication < ApplicationRecord
  belongs_to :user
  belongs_to :medication

  def find_name
    Medication.find(self.id).name
  end

  def find_strength
    Medication.find(self.id).strength
  end

  def find_description
    Medication.find(self.id).description
  end

  def find_instruction
    Medication.find(self.id).instruction
  end

  def find_condition
    Medication.find(self.id).condition_cure
  end
end
