module WPDB
  class Option < ActiveRecord::Base
    self.table_name = "cgjbugpbs_options"
    self.primary_key = :option_id
  end
end
