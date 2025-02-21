# encoding: UTF-8
lib = File.expand_path('../lib/', __FILE__)
$LOAD_PATH.unshift lib unless $LOAD_PATH.include?(lib)

require 'spree_properties_m17n/version'

Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY
  s.name        = 'spree_properties_m17n'
  s.version     = SpreePropertiesM17n::VERSION
  s.summary     = "Spree Commerce Properties m17n Extension"
  s.required_ruby_version = '>= 3.0'

  s.author      = 'be agile Co., Ltd.'
  s.email       = 'develop@be-agile.jp'
  s.homepage    = 'https://github.com/be-agile/ba_spree_properties'
  s.licenses    = ['AGPL-3.0-or-later', 'BSD-3-Clause']

  s.files       = `git ls-files`.split("\n").reject { |f| f.match(/^spec/) && !f.match(/^spec\/fixtures/) }
  s.require_path = 'lib'
  s.requirements << 'none'

  s.add_dependency 'spree', '>= 4.10.1'
  s.add_dependency 'spree_extension'

  s.add_development_dependency 'spree_dev_tools'
end
