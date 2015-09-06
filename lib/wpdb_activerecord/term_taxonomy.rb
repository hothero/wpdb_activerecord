module WPDB
  class TermTaxonomy < ActiveRecord::Base
    self.table_name = "cgjbugpbs_term_taxonomy"
    self.primary_key = :term_taxonomy_id

    belongs_to :term, foreign_key: "term_id", class_name: "WPDB::Term"
    has_many :term_relationships, foreign_key: "term_taxonomy_id", class_name: "WPDB::TermRelationship"

    has_many :posts, through: :term_relationships, class_name: "WPDB::Post"
  end
end
