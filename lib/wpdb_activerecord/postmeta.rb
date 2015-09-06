module WPDB
  class Postmeta < ActiveRecord::Base
    self.table_name = "cgjbugpbs_postmeta"
    self.primary_key = :meta_id

    belongs_to :post, foreign_key: "post_id", class_name: "WPDB::Post"
  end
end
