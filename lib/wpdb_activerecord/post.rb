module WPDB
  class Post < ActiveRecord::Base
    self.table_name = "cgjbugpbs_posts"
    self.primary_key = :ID

    belongs_to :author, class_name: "WPDB::User", foreign_key: "post_author"
    belongs_to :parent, class: self

    # tag / category
    has_many :term_relationships, foreign_key: "object_id", class_name: "WPDB::TermRelationship"
    has_many :terms, through: :term_relationships, foreign_key: "term_id", class_name: "WPDB::Term"
    has_many :tags, -> { where("#{WPDB::TermTaxonomy.table_name}.taxonomy = 'post_tag'") }, through: :terms, source: :term_taxonomy, class_name: "WPDB::Term"
    has_many :categories, -> { where("#{WPDB::TermTaxonomy.table_name}.taxonomy = 'category'") }, through: :terms, source: :term_taxonomy, class_name: "WPDB::Term"

    has_many :attachments, -> { where(post_type: "attachment") }, foreign_key: "post_parent", class: self
    has_many :revisions, -> { where(post_type: "revision") }, foreign_key: "post_parent", class: self
    has_many :postmetas, foreign_key: "post_id", class_name: "WPDB::Postmeta"
  end
end
