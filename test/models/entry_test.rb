require 'test_helper'

class EntryTest < ActiveSupport::TestCase
   test "should not save an entry without a debit" do
     entry = Entry.new credit: accounts(:rent), amount: 100, transaction_date: 2.day.ago.to_s(:db)
     assert_not entry.save, "Saved an entry without a debit."
   end

   test "should not save an entry without a credit" do
     entry = Entry.new debit: accounts(:cash), amount: 100, transaction_date: 2.day.ago.to_s(:db)
     assert_not entry.save, "Saved an entry without a credit."
   end

   test "should not save an entry without an amount" do
     entry = Entry.new credit: accounts(:rent), debit: accounts(:cash), transaction_date: 2.day.ago.to_s(:db)
     assert_not entry.save, "Saved an entry without an amount."
   end

   test "should not save an entry without a transaction_date" do
     entry = Entry.new credit: accounts(:rent), debit: accounts(:cash), amount: 100
     assert_not entry.save, "Saved an entry without a transaction_date."
   end

   test "should save an entry with all attributes" do
     entry = Entry.new credit: accounts(:rent), debit: accounts(:cash), amount: 100, transaction_date: 2.day.ago.to_s(:db)
     assert entry.save, "Failed to save an entry with all attributes."
   end
end
