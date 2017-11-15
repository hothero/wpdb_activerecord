module WPDB
  class Option < ActiveRecord::Base
    self.table_name = "#{WPDB.configuration.prefix}options"
    self.primary_key = :option_id

    def self.get_option(name)
      self.where(option_name: name).first.option_value
    end
  end
end
