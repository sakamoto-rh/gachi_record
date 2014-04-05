#
# == コネクションクラス
# Mysql2のみに対応。
#
require 'mysql2'
module GachiRecord
  module Connection
    include GachiRecord::Config
    extend self

    def connect
      @@connect ||=  Mysql2::Client.new(database: database, username: username, password: password, socket: socket)
    end

    def escape(params)
      self.connect if @@connect
      @@connect.escape(params)

    end
  end
end
