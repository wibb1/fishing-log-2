class AddEnumsAndRenameColumn < ActiveRecord::Migration[5.2]
  def change
    rename_column :records, :success, :old_success
    change_column_null :records, :old_success, true
    add_column :records, :success, :integer, default: 0, null: false
  end
end
