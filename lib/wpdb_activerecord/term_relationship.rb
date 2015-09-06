module WPDB
  class TermRelationship < ActiveRecord::Base
    self.table_name = "#{WPDB.configuration.prefix}term_relationships"
    self.primary_key =  :object_id

    belongs_to :term_taxonomy, foreign_key: "term_taxonomy_id", class_name: WPDB.configuration.term_taxonomy_class

    belongs_to :post, foreign_key: "object_id", class_name: WPDB.configuration.post_class
  end
end
