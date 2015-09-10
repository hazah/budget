require 'test_helper'

class AccountClassificationTest < ActiveSupport::TestCase
   test "should not save account classification without name" do
     classification = AccountClassification.new normal_balance: 'credit'
     assert_not classification.save, "Saved account classification without a name."
   end

   test "should not save account classification without normal_balance" do
     classification = AccountClassification.new name: 'classification'
     assert_not classification.save, "Saved account classification without a normal_balance."
   end

   test "should save account classification with name and normal_balance" do
     classification = AccountClassification.new name: 'classification', normal_balance: 'credit'
     assert classification.save, "Failed to save account classification with a name and normal_balance."
   end

   test "should not save two classifications with the same name" do
     classification = { name: 'classification', normal_balance: 'credit' }
     AccountClassification.create classification
     classification = AccountClassification.create classification
     assert_not classification.save, "Saved a second account classification with existing name."
   end

   test "should save two classifications with two different names" do
     AccountClassification.create  name: 'classification', normal_balance: 'credit'
     classification = AccountClassification.create  name: 'second classification', normal_balance: 'credit'
     assert classification.save, "Failed to save a second account classification with different name."
   end

   test "should not save classification with normal_balance other than debit or credit" do
     classification = AccountClassification.new name: 'classification', normal_balance: 'random'
     assert_not classification.save, "Saved account classification with a normal_balance other than debit or credit."
   end

   test "should save classification with normal_balance debit" do
     classification = AccountClassification.new name: 'classification', normal_balance: 'debit'
     assert classification.save, "Failed to save account classification with a normal_balance of debit."
   end

   test "should save classification with normal_balance credit" do
     classification = AccountClassification.new name: 'classification', normal_balance: 'credit'
     assert classification.save, "Failed to save account classification with a normal_balance of credit."
   end

end
