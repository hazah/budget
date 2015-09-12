class Account < ActiveRecord::Base
  validates :name, uniqueness: true
  validates :name, :account_classification, presence: true

  belongs_to :account_classification

  has_many :debit_entries, class_name: 'Entry', inverse_of: :debit, foreign_key: :debit_id
  has_many :credit_entries, class_name: 'Entry', inverse_of: :credit, foreign_key: :credit_id

  def balance
    @balance ||= debit_entries.sum(:amount) - credit_entries.sum(:amount)
  end

  def transfer_to account, amount
    credit_entries.create! debit: account, amount: amount, transaction_date: Date.today
    account.debit_entries.reload
    account.reset_balance!
    reset_balance!
  end

  def reset_balance!
    @balance = nil
  end
end
