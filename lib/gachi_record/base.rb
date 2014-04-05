require 'mysql2'
#TODO: sakamoto $: or $LOAD_PATHにlibを読込ませるオートロードファイルを作ること
require './lib/gachi_record/connection'
require './lib/gachi_record/config'
module GachiRecord
  class Base
    extend GachiRecord::Connection
    def self.find(id)
      case id
      when Integer
        condition = self.connect.escape("id = #{id}")
      when Array
        condition = self.connect.escape("id in (#{id.join(',')})")
      else
        raise
      end
      self.connect.query("select * from #{table_name} where #{condition}").to_a
    end

    #TODO: sakamoto モデルから読込めるようにすること 
    def self.table_name
      "users"
    end
  end
end
