module WPDB
  class Term < ActiveRecord::Base
    self.table_name = "cgjbugpbs_terms"
    self.primary_key = :term_id

    has_one :term_taxonomy, foreign_key: "term_id", class_name: "WPDB::TermTaxonomy"
    has_many :term_taxonomies, foreign_key: "term_id", class_name: "WPDB::TermTaxonomy"

    scope :tag, -> { joins(:term_taxonomy).where("#{WPDB::TermTaxonomy.table_name}.taxonomy = 'post_tag'") }
    scope :category, -> { joins(:term_taxonomy).where("#{WPDB::TermTaxonomy.table_name}.taxonomy = 'category'") }
  end
end
