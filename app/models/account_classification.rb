class AccountClassification < ActiveRecord::Base
  validates :name, presence: true
  validates :normal_balance, presence: true
end
