class AccountClassification < ActiveRecord::Base
  validates :name, :normal_balance, presence: true
  validates :name, uniqueness: true
  validates :normal_balance, inclusion: { in: %w( debit credit ) }

  has_many :accounts, inverse_of: :account_classification
end
