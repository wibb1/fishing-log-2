class CreateSpecies < ActiveRecord::Migration[5.2]
  def change
    create_table :species do |t|
      t.string :name, null: false
      t.string :water_column, null: false
      t.string :legal_size, null: false
      t.string :legal_size_slot, null: false, default: "NA"
      t.string :legal_size_super, null: false, default: "NA"
    end
  end
end
