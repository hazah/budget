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
  AccountClassification.first_or_create! account_classification
end
