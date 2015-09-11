require 'test_helper'

class AccountTest < ActiveSupport::TestCase
  test "should not save account without a name" do
    account = Account.new account_classification: account_classifications(:debit)
    assert_not account.save, "Saved an account without a name."
  end

  test "should not save account without an account_classification" do
    account = Account.new name: 'account witout account_classification'
    assert_not account.save, "Saved an account without an account_classification."
  end

  test "should save account with a name and an account_classification" do
    account = Account.new name: 'account with name and account_classification', account_classification: account_classifications(:debit)
    assert account.save, "Failed to save an account with a name and an account_classification."
  end

  test "should not save two accounts with the same name" do
     account = { name: 'account', account_classification: account_classifications(:debit) }
     Account.create account
     account = Account.new account
     assert_not account.save, "Saved a second account with existing name."
   end

   test "should save two accounts with different name" do
     Account.create name: 'account 1', account_classification: account_classifications(:debit)
     account = Account.new name: 'account 2', account_classification: account_classifications(:debit)
     assert account.save, "Failed to save a second account with a different name."
   end
end
