require_relative '20200831202838_create_join_table_species_records.rb'

class RemoveReferenceFromSpecies < ActiveRecord::Migration[5.2]
  def change
    remove_reference :species, :records, index: true
    revert CreateJoinTableSpeciesRecords
    add_reference :records, :species, index: true
  end
end
