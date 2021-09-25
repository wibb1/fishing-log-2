class CreateJoinTableSpeciesRecords < ActiveRecord::Migration[5.2]
  def change
    create_join_table :species, :records do |t|
      t.index [:species_id, :record_id]
      t.index [:record_id, :species_id]
    end
  end
end
