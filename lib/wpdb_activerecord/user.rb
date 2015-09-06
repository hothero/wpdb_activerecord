require "phpass"

module WPDB
  class User < ActiveRecord::Base
    self.table_name = "cgjbugpbs_users"
    self.primary_key = :ID

    has_many :posts, foreign_key: "post_author", class_name: "WPDB::Post"
    has_many :usermetas, foreign_key: "user_id", class_name: "WPDB::Usermeta"

    def check_password?(password)
      phpass.check(password, self.user_pass)
    end
  end
end
