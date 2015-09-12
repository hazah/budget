class AddCreditFkToEntry < ActiveRecord::Migration
  def change
    add_foreign_key :entries, :accounts, column: :credit_id
  end
end
