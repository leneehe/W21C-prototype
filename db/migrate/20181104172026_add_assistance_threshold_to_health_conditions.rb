class AddAssistanceThresholdToHealthConditions < ActiveRecord::Migration[5.2]
  def change
    add_column :health_conditions, :assistance_threshold, :float
  end
end
