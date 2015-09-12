class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.references :debit, index: true, null: false
      t.references :credit, index: true, null: false
      t.decimal :amount, precision: 10, scale: 2, null: false
      t.date :transaction_date, null: false

      t.timestamps null: false

      t.foreign_key :accounts, column: :debit_id
      t.foreign_key :accounts, column: :credit_id
    end
  end
end
