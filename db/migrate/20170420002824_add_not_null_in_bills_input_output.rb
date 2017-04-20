class AddNotNullInBillsInputOutput < ActiveRecord::Migration[5.0]
  def change
    change_column_null :bills, :input, false
    change_column_null :bills, :output, false
  end
end
