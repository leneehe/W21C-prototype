class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :health_conditions
  has_many :goals
  has_many :tracked_medications
  has_many :mediacations, through: :tracked_medications
end
