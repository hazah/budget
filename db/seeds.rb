# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
AdminUser.create! email: 'admin@example.com', password: 'password', password_confirmation: 'password' if AdminUser.count == 0

[
  {name: 'asset', normal_balance: 'debit'},
  {name: 'contra asset', normal_balance: 'credit'},
  {name: 'liability', normal_balance: 'credit'},
  {name: 'contra liability', normal_balance: 'debit'},
  {name: 'owner equity', normal_balance: 'credit'},
  {name: 'stockholder equity', normal_balance: 'credit'},
  {name: 'dividend', normal_balance: 'debit'},
  {name: 'income', normal_balance: 'credit'},
  {name: 'expense', normal_balance: 'debit'},
  {name: 'gain', normal_balance: 'credit'},
  {name: 'loss', normal_balance: 'debit'}
].each do |account_classification|
  AccountClassification.where(account_classification).first_or_create!
end
[
  {name: 'cash', account_classification: AccountClassification.find_by(name: 'asset')},
  {name: 'checking', account_classification: AccountClassification.find_by(name: 'asset')},
  {name: 'checking fee', account_classification: AccountClassification.find_by(name: 'expense')},
  {name: 'checking overdraft', account_classification: AccountClassification.find_by(name: 'liability')},
  {name: 'savings', account_classification: AccountClassification.find_by(name: 'asset')},
  {name: 'savings fee', account_classification: AccountClassification.find_by(name: 'expense')},
  {name: 'savings overdraft', account_classification: AccountClassification.find_by(name: 'liability')},
  {name: 'visa', account_classification: AccountClassification.find_by(name: 'liability')},
  {name: 'television', account_classification: AccountClassification.find_by(name: 'expense')},
  {name: 'internet', account_classification: AccountClassification.find_by(name: 'expense')},
  {name: 'food', account_classification: AccountClassification.find_by(name: 'expense')},
  {name: 'gas', account_classification: AccountClassification.find_by(name: 'expense')},
  {name: 'electricity', account_classification: AccountClassification.find_by(name: 'expense')},
  {name: 'water', account_classification: AccountClassification.find_by(name: 'expense')},
  {name: 'sweage', account_classification: AccountClassification.find_by(name: 'expense')},
  {name: 'phones', account_classification: AccountClassification.find_by(name: 'expense')},
  {name: 'trash', account_classification: AccountClassification.find_by(name: 'expense')},
  {name: 'car', account_classification: AccountClassification.find_by(name: 'expense')},
  {name: 'mortgage', account_classification: AccountClassification.find_by(name: 'expense')},
  {name: 'life insureance', account_classification: AccountClassification.find_by(name: 'expense')},
  {name: 'car insurance', account_classification: AccountClassification.find_by(name: 'expense')},
  {name: 'plates & tags', account_classification: AccountClassification.find_by(name: 'expense')},
  {name: 'christmas fund', account_classification: AccountClassification.find_by(name: 'asset')},
  {name: 'birthday fund', account_classification: AccountClassification.find_by(name: 'asset')},
  {name: 'personal allowances', account_classification: AccountClassification.find_by(name: 'asset')},
  {name: 'slush fund', account_classification: AccountClassification.find_by(name: 'asset')},
  {name: 'work income', account_classification: AccountClassification.find_by(name: 'income')},
  {name: 'black hole', account_classification: AccountClassification.find_by(name: 'loss')},
  {name: 'loan', account_classification: AccountClassification.find_by(name: 'liability')},
  {name: 'luck', account_classification: AccountClassification.find_by(name: 'gain')}
].each do |account|
  Account.where(account).first_or_create!
end
