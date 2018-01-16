module WPDB
  class Post < ActiveRecord::Base
    self.table_name = "#{WPDB.configuration.prefix}posts"
    self.primary_key = :ID

    belongs_to :author, class_name: WPDB.configuration.user_class, foreign_key: "post_author"
    belongs_to :parent, class_name: WPDB.configuration.post_class

    has_many :comments, foreign_key: "comment_post_ID", class_name: WPDB.configuration.comment_class
    
    # tag / category
    has_many :term_relationships, foreign_key: "object_id", class_name: WPDB.configuration.term_relationship_class
    has_many :terms, through: :term_relationships, foreign_key: "term_id", class_name: WPDB.configuration.term_class
    has_many :tags, -> { where("#{WPDB.configuration.term_taxonomy_class.constantize.table_name}.taxonomy = 'post_tag'") }, through: :terms, source: :term_taxonomy, class_name: WPDB.configuration.term_class
    has_many :categories, -> { where("#{WPDB.configuration.term_taxonomy_class.constantize.table_name}.taxonomy = 'category'") }, through: :terms, source: :term_taxonomy, class_name: WPDB.configuration.term_class

    has_many :attachments, -> { where(post_type: "attachment") }, foreign_key: "post_parent", class_name: WPDB.configuration.post_class
    has_many :revisions, -> { where(post_type: "revision") }, foreign_key: "post_parent", class_name: WPDB.configuration.post_class
    has_many :postmetas, foreign_key: "post_id", class_name: WPDB.configuration.postmeta_class

    private

    def timestamp_attributes_for_update
      [:updated_at, :updated_on, :post_modified]
    end
  end
end
