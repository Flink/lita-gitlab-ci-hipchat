require 'simplecov'
require 'coveralls'
require 'vcr'

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter[
  SimpleCov::Formatter::HTMLFormatter,
  Coveralls::SimpleCov::Formatter
]
SimpleCov.start { add_filter "/spec/" }

require 'fabrication'
require "lita-gitlab-ci-hipchat"
require "lita/rspec"
Lita.version_3_compatibility_mode = false

VCR.configure do |config|
  config.cassette_library_dir = 'spec/fixtures/cassettes'
  config.hook_into :webmock
end
