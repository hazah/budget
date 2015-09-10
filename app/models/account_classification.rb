class AccountClassification < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  validates :normal_balance, presence: true, inclusion: { in: %w( debit credit) }

  has_many :accounts, inverse_of: :account_classification
end
