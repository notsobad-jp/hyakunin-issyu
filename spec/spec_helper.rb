require "rubygems"
require "bundler/setup"
require "HyakuninIssyu"
require 'coveralls'
Coveralls.wear!

RSpec.configure do |config|
  config.mock_framework = :rspec
end

