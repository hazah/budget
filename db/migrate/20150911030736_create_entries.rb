class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.references :debit, index: true, foreign_key: { table_name: :account }, null: false
      t.references :credit, index: true, foreign_key: { table_name: :account }, null: false
      t.decimal :amount, precision: 10, scale: 2, null: false
      t.date :transaction_date, null: false

      t.timestamps null: false
    end
  end
end
