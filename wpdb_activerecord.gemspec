$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "wpdb_activerecord/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "wpdb_activerecord"
  s.version     = WpdbActiverecord::VERSION
  s.authors     = ["hothero"]
  s.email       = ["hothero0705@gmail.com"]
  s.homepage    = "https://github.com/hothero/wpdb_activerecord"
  s.summary     = "A ActiveRecord ORM wrapper for WordPress"
  s.description = "WpdbActiverecord gives you a painless way to access and interact with WordPress from ActiveRecord, accessing posts, tags, and all other WordPress concepts as plain-old Ruby objects."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc", "Gemfile"]
  s.test_files = Dir["test/**/*"]

  s.add_runtime_dependency "php-serialize", "~> 1.1"
  s.add_runtime_dependency "phpass-ruby", "~> 0.1"

  s.add_dependency "rails", "~> 4.0"
  s.add_dependency "mysql2", "~> 0.3.0"
end
