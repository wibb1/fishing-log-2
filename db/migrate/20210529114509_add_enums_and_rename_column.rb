class AddEnumsAndRenameColumn < ActiveRecord::Migration[5.2]
  def change
    rename_column :records, :success, :old_success
    add_column :records, :success, :integer
  end
end
