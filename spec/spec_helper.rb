require "rubygems"
require "bundler/setup"
require "HyakuninIssyu"
require 'coveralls'
Coveralls.wear!

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter[
  SimpleCov::Formatter::HTMLFormatter,
  Coveralls::SimpleCov::Formatter
]

RSpec.configure do |config|
  config.mock_framework = :rspec
end

