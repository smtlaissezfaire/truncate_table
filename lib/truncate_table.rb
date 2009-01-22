module TruncateTable
  def truncate_table!
    connection.execute("TRUNCATE TABLE `#{table_name}`")
  end
end
