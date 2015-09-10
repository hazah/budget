require 'test_helper'

class AccountTest < ActiveSupport::TestCase
  test "should not save account without a name" do
    account = Account.new account_classification: account_classifications(:debit)
    assert_not account.save, "Saved an account without a name."
  end

  test "should not save two accounts with the same name" do
     account = { name: 'account', account_classification: account_classifications(:debit) }
     Account.create account
     account = Account.create account
     assert_not account.save, "Saved a second account with existing name."
   end

   test "should not save account without an account_classification" do
    account = Account.new name: 'account witout account_classification'
    assert_not account.save, "Saved an account without an account_classification."
  end
end
