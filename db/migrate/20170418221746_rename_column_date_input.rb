class RenameColumnDateInput < ActiveRecord::Migration[5.0]
  def change
    rename_column :bills, :date_input, :date_record
  end
end
