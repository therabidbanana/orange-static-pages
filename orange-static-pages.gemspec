# encoding: utf-8

$:.unshift File.expand_path('../lib', __FILE__)
require 'orange_static_pages/version'

Gem::Specification.new do |s|
  s.name         = "orange-static-pages"
  s.version      = OrangeStaticPages::VERSION
  s.authors      = ["David Haslem"]
  s.email        = "therabidbanana@gmail.com"
  s.homepage     = "http://github.com/therabidbanana/orange-static-pages"
  s.summary      = "[summary]"
  s.description  = "[description]"

  s.files        = `git ls-files app lib`.split("\n")
  s.platform     = Gem::Platform::RUBY
  s.require_path = 'lib'
  s.rubyforge_project = '[none]'
  s.required_rubygems_version = '>= 1.3.6'
end
