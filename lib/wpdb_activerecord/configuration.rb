module WPDB
  class << self
    attr_accessor :configuration

    def configure
      self.configuration ||= Configuration.new
      yield(configuration) if block_given?
    end
  end

  class Configuration
    attr_accessor :prefix, :option_class, :comment_class, :post_class, :postmeta_class, :term_class,
                  :term_relationship_class, :term_taxonomy_class,
                  :user_class, :usermeta_class

    def initialize
      path = File.join(root, "config", "wpdb_config.yml")
      config = File.exists?(path) ? YAML.load_file(path) : Hash.new
      @prefix = config["WPDB_PREFIX"] || "wp_"
      @option_class = config["WPDB_OPTION_CLASS"] || "WPDB::Option"
      @comment_class = config["WPDB_COMMENT_CLASS"] || "WPDB::Comment"
      @post_class = config["WPDB_POST_CLASS"] || "WPDB::Post"
      @postmeta_class = config["WPDB_POSTMETA_CLASS"] || "WPDB::Postmeta"
      @term_class = config["WPDB_TERM_CLASS"] || "WPDB::Term"
      @term_relationship_class = config["WPDB_TERM_RELATIONSHIP_CLASS"] || "WPDB::TermRelationship"
      @term_taxonomy_class = config["WPDB_TERM_TAXONOMY_CLASS"] || "WPDB::TermTaxonomy"
      @user_class = config["WPDB_USER_CLASS"] || "WPDB::User"
      @usermeta_class = config["WPDB_USERMETA_CLASS"] || "WPDB::Usermeta"
    end

    def root
      Rails.root || Pathname.new(ENV["RAILS_ROOT"] || Dir.pwd)
    end
  end
end

WPDB.configure
