require "HyakuninIssyu/version"
require "yaml"

class HyakuninIssyu
  Authors = YAML.load_file(File.expand_path(File.join('..', 'data', 'authors.yml'), __FILE__))
  Songs = YAML.load_file(File.expand_path(File.join('..', 'data', 'songs.yml'), __FILE__))

	class << self
		def author
			Authors
		end
	end
end
