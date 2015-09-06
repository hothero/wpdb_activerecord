module WPDB
  class Usermeta < ActiveRecord::Base
    self.table_name = "#{WPDB.configuration.prefix}usermeta"
    self.primary_key = :umeta_id

    belongs_to :user, foreign_key: "user_id", class_name: WPDB.configuration.user_class
  end
end
