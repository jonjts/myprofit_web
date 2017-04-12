class CreateBill < ActiveRecord::Migration[5.0]
  def change
    create_table :bills do |t|
      t.string :title
      t.decimal :input, precision: 15, scale: 2, :default => 0
      t.decimal :output, precision: 15, scale: 2, :default => 0
      t.timestamp :date_input
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
