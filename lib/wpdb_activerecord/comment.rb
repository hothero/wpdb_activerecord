module WPDB
  class Comment < ActiveRecord::Base
    self.table_name = "#{WPDB.configuration.prefix}comments"
    self.primary_key =  :comment_ID

    belongs_to :post, foreign_key: "comment_post_ID", class_name: WPDB.configuration.post_class
  end
end
