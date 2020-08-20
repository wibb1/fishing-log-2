class AddColumnsToRecord < ActiveRecord::Migration[5.2]
  def change
    add_column :records, :body, :text
    add_column :records, :latitude, :decimal, null: false
    add_column :records, :longitude, :decimal, null: false
    add_column :records, :date, :text, null: false
    add_column :records, :time, :text, null: false
    add_column :records, :datetime, :datetime, null: false
  end
end
