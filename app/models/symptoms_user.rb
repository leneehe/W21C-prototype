class SymptomsUser < ApplicationRecord
  belongs_to :user
  belongs_to :symptom
end
