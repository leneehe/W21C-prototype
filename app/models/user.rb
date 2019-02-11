class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :email, presence: true, length: {maximum: 30}, :uniqueness => { :case_sensitive => false }

  # has_many :symptoms
  has_and_belongs_to_many :symptoms
  has_many :goals
  has_many :tracked_medications
  has_many :medications, through: :tracked_medications
  has_many :events
  has_many :event_types, through: :events
  has_many :checklists, through: :events
  has_and_belongs_to_many :conditions
  has_many :tracked_symptoms
end
