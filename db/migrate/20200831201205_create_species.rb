class CreateSpecies < ActiveRecord::Migration[5.2]
  def change
    create_table :species do |t|
      t.string :common_name, null: false
      t.string :scientific_name, null: false
      t.string :water_column, null: false
      t.string :legal_size, null: false
      t.string :season_dates, null: false, default: "NA"
      t.string :bag_limits, null: false, default: "NA"
      t.timestamps null: false
      t.belongs_to :records

    end
  end
end
