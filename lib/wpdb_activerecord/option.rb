module WPDB
  class Option < ActiveRecord::Base
    self.table_name = "#{WPDB.configuration.prefix}options"
    self.primary_key = :option_id
  end
end
