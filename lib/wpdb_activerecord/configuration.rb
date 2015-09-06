module WPDB
  class << self
    attr_accessor :configuration

    def initialize
      self.configuration = Configuration.new
    end

    def configure
      self.configuration ||= Configuration.new
      yield(configuration) if block_given?
    end
  end

  class Configuration
    attr_accessor :prefix, :post_class, :postmeta_class, :term_class,
                  :term_relationship_class, :term_taxonomy_class,
                  :user_class, :usermeta_class

    def initialize
      @prefix = "wp_"
      @post_class = "WPDB::Post"
      @postmeta_class = "WPDB::Postmeta"
      @term_class = "WPDB::Term"
      @term_relationship_class = "WPDB::TermRelationship"
      @term_taxonomy_class = "WPDB::TermTaxonomy"
      @user_class = "WPDB::User"
      @usermeta_class = "WPDB::Usermeta"
    end

    def test(a)
      @prefix = a
    end
  end
end

WPDB.configure
