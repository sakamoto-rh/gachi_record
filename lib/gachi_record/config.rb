#
# == コンフィグ読込クラス
# Railsで一般的に使われるdatabase.ymlを参考にすること。
# mysqlのみ対応
#
# = 設定ファイル
# ./config/database.yml
#
# = 必要な環境変数
#   gachi_env database.ymlのtop_name
#
require 'Yaml'
module GachiRecord
  module Config
    SETTING_FILE = "config/database.yml"
    CONFIG_DATA = YAML.load_file(self::SETTING_FILE)
    
    CONFIG_DATA.each do |e, values| 
      values.each do |data_key, data|
        define_method data_key.to_sym do
          CONFIG_DATA[env][data_key]
        end
      end
    end

    def env
      ENV["gachi_env"] || "development"
    end

    def root
      ENV["gachi_root"] || "/Users/sakamoto/workspace/tests/study/gachi_record/"
    end
  end
end

