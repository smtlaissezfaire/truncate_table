
require "rubygems"
require "spec"

require "active_record"
require File.dirname(__FILE__) + "/../init"

db_file = File.dirname(__FILE__) + "/connection.yml"
ActiveRecord::Base.establish_connection YAML.load(File.read(db_file))
ActiveRecord::Migration.verbose = true

ActiveRecord::Schema.define do  
  create_table :users, :force => true do |t|
    t.column  :username,  :string
    t.timestamps
  end
end

class User < ActiveRecord::Base
end
