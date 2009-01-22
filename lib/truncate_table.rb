module TruncateTable
  def truncate_table!
    begin
      connection.execute("TRUNCATE TABLE `#{table_name}`")
    rescue
      connection.execute("DELETE FROM `#{table_name}`")
    end
  end
end
