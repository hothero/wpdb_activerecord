module WPDB
  class User < ActiveRecord::Base
    self.table_name = "#{WPDB.configuration.prefix}users"
    self.primary_key = :ID

    has_many :posts, foreign_key: "post_author", class_name: WPDB.configuration.post_class
    has_many :usermetas, foreign_key: "user_id", class_name: WPDB.configuration.usermeta_class

    def check_password?(password)
      phpass.check(password, self.user_pass)
    end
  end
end
