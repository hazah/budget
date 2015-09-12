class Account < ActiveRecord::Base
  validates :name, uniqueness: true
  validates :name, :account_classification, presence: true

  belongs_to :account_classification
end
