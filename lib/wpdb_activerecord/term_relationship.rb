module WPDB
  class TermRelationship < ActiveRecord::Base
    self.table_name = "cgjbugpbs_term_relationships"
    self.primary_key =  :object_id

    belongs_to :term_taxonomy, foreign_key: "term_taxonomy_id", class_name: "WPDB::TermTaxonomy"
    has_one :term, through: :term_taxonomy, class_name: "WPDB::Term"

    belongs_to :post, foreign_key: "object_id", class_name: "WPDB::Post"
  end
end
