$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "icofont/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "icofont"
  s.version     = Icofont::VERSION
  s.authors     = ["Artan Sinani"]
  s.email       = ["artisinani@gmail.com"]
  s.homepage    = "http://lugolabs.com/blog/2014/01/07/icofont-manage-your-web-icon-fonts-inside-rails"
  s.license     = "MIT"
  s.summary     = "Manage your icon fonts assets inside your application"
  s.description = "Provides a web interface to a large collection of free icon fonts, so that you can inlcude only the fonts you need in your application."

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.0", ">= 4.0.0"
  s.add_dependency "fontcustom", "~> 1.3.1"

  s.add_development_dependency "sqlite3"
  s.add_development_dependency "jquery-rails"
end
