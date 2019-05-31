class SuggestedSymptom < ApplicationRecord
  belongs_to :condition
  belongs_to :symptom
end
