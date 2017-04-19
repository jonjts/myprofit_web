class ChangeColumnDateInput < ActiveRecord::Migration[5.0]
  def change
    change_column :bills, :date_input, :date
  end
end
