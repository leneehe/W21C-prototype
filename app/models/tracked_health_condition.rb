class TrackedHealthCondition < ApplicationRecord
  belongs_to :health_condition
  belongs_to :value_type

  scope :one_week_ago, -> { where('created_at >= ?', 1.week.ago) }
  scope :one_month_ago, -> { where('created_at >= ?', 1.month.ago) }
  scope :one_day_ago, -> { where('created_at >= ?', 1.day.ago) }
  scope :one_year_ago, -> { where('created_at >= ?', 1.year.ago) }

end
