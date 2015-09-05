$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "wpdb_activerecord/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "wpdb_activerecord"
  s.version     = WpdbActiverecord::VERSION
  s.authors     = ["ronald.hsu"]
  s.email       = ["hothero0705@gmail.com"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of WpdbActiverecord."
  s.description = "TODO: Description of WpdbActiverecord."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.2.3"

  s.add_development_dependency "sqlite3"
end
