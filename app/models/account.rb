class Account < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  validates :account_classification, presence: true

  belongs_to :account_classification
end
