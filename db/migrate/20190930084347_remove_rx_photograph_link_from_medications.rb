class RemoveRxPhotographLinkFromMedications < ActiveRecord::Migration[5.2]
  def change
    remove_column :medications, :rx_photograph_link, :string
  end
end
