require File.dirname(__FILE__) + "/spec_helper"

describe TruncateTable do
  describe "with a database that supports truncation" do
    it "should execute the 'TRUNCATE TABLE 'table_name'"

    it "should remove all rows"

    it "should use the proper table name"
  end

  describe "with a database that doesn't support TRUNCATE" do
    it "should DELETE * FROM `table`"

    it "should remove all rows"

    it "should use the proper table name"
  end
end
