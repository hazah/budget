class CreateAccountClassifications < ActiveRecord::Migration
  def change
    create_table :account_classifications do |t|
      t.string :name,           null: false, default: "", index: { unique: true }
      t.string :normal_balance, null: false, default: ""

      t.timestamps null: false
    end
  end
end
