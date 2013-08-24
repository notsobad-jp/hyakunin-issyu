require "HyakuninIssyu/version"
require "yaml"

module HyakuninIssyu
  AUTHORS = YAML.load_file(File.expand_path(File.join('..', 'data', 'authors.yml'), __FILE__))
  POEMS = YAML.load_file(File.expand_path(File.join('..', 'data', 'poems.yml'), __FILE__))

	def calc
		"hogehoge"
	end
	module_function :calc
end
