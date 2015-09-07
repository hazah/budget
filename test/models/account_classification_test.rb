require 'test_helper'

class AccountClassificationTest < ActiveSupport::TestCase
   test "should not save accout classification without name" do
     classification = AccountClassification.new normal_balance: 'credit'
     assert_not classification.save, "Saved accout classification without a name."
   end

   test "should not save accout classification without normal_balance" do
     classification = AccountClassification.new name: 'classification'
     assert_not classification.save, "Saved accout classification without a normal_balance."
   end
end
