class Entry < ActiveRecord::Base
  validates :debit, :credit, :amount, :transaction_date, presence: true

  belongs_to :debit, class_name: 'Account', inverse_of: :debit_entries
  belongs_to :credit, class_name: 'Account', inverse_of: :credit_entries
end
