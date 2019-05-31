class ChangeGoals < ActiveRecord::Migration[5.2]
  def up
    remove_column :goals, :name, :string
    remove_column :goals, :description, :string

    add_column :goals, :specific_1, :string
    add_column :goals, :specific_2, :string
    add_column :goals, :specific_3, :string
    add_column :goals, :specific_4, :string

    add_column :goals, :measurable_1, :string
    add_column :goals, :measurable_2, :string
    add_column :goals, :measurable_3, :string
    add_column :goals, :measurable_4, :string

    add_column :goals, :attainable_1, :string
    add_column :goals, :attainable_2, :string
    add_column :goals, :attainable_3, :string
    add_column :goals, :attainable_4, :string

    add_column :goals, :rewarding_1, :string
    add_column :goals, :rewarding_2, :string
    add_column :goals, :rewarding_3, :string
    add_column :goals, :rewarding_4, :string

    add_column :goals, :timely_1, :string
    add_column :goals, :timely_2, :string

  end

  def down
    add_column :goals, :name, :string
    add_column :goals, :description, :string

    remove_column :goals, :specific_1, :string
    remove_column :goals, :specific_2, :string
    remove_column :goals, :specific_3, :string
    remove_column :goals, :specific_4, :string

    remove_column :goals, :measurable_1, :string
    remove_column :goals, :measurable_2, :string
    remove_column :goals, :measurable_3, :string
    remove_column :goals, :measurable_4, :string

    remove_column :goals, :attainable_1, :string
    remove_column :goals, :attainable_2, :string
    remove_column :goals, :attainable_3, :string
    remove_column :goals, :attainable_4, :string

    remove_column :goals, :rewarding_1, :string
    remove_column :goals, :rewarding_2, :string
    remove_column :goals, :rewarding_3, :string
    remove_column :goals, :rewarding_4, :string

    remove_column :goals, :timely_1, :string
    remove_column :goals, :timely_2, :string
  end
end
