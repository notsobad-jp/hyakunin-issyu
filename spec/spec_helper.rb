require "rubygems"
require "bundler/setup"
require "HyakuninIssyu"
require "moji"

RSpec.configure do |config|
  config.mock_framework = :rspec
end

RSpec::Matchers.define :include_kanji do |channel, expected_message|
  match do |str|
		result = false
		str.split(//u).each do |char|
			result = true if Moji.type?(char, Moji::ZEN_KANJI)
		end
		result
  end
end

RSpec::Matchers.define :include_kana do |channel, expected_message|
  match do |str|
		result = false
		str.split(//u).each do |char|
			result = true if Moji.type?(char, Moji::ZEN_HIRA)
		end
		result
  end
end

RSpec::Matchers.define :be_english do |channel, expected_message|
  match do |str|
		Moji.type?(str, Moji::HAN)
  end
end
