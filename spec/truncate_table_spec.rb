require File.dirname(__FILE__) + "/spec_helper"

describe TruncateTable do
  describe "with a database that supports truncation" do
    before(:each) do
      @connection = connection
    end

    def connection
      active_record.connection
    end

    def active_record
      ActiveRecord::Base
    end

    it "should execute the 'TRUNCATE TABLE 'table_name'" do
      @connection.stub!(:execute).and_return true
      @connection.should_receive(:execute).with("TRUNCATE TABLE `users`")
      User.truncate_table!
    end

    it "should use the proper table name" do
      klass = User.dup
      klass.set_table_name "foo"

      @connection.stub!(:execute).and_return true
      @connection.should_receive(:execute).with("TRUNCATE TABLE `foo`")
      klass.truncate_table!
    end

    it "should remove all rows" do
      User.create!
      User.create!

      User.truncate_table!
      User.count.should == 0
    end
  end

  describe "with a database that doesn't support TRUNCATE" do
    it "should DELETE * FROM `table`"

    it "should remove all rows"

    it "should use the proper table name"
  end
end
