class ReorganizeSpeciesTable < ActiveRecord::Migration[5.2]
  def change
    rename_column :species, :water_column, :shallow_depth
    add_column :species, :deep_depth, :string, null: false
    remove_column :species, :legal_size
    remove_column :species, :season_dates
    remove_column :species, :bag_limits

  end
end
