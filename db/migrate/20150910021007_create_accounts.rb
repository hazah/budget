class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.string :name, null: false, default: "", index: { unique: true }
      t.references :account_classification, null: false, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
