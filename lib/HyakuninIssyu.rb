require "HyakuninIssyu/version"
require "yaml"

module HyakuninIssyu
	class Poem
		def initialize(id)
			poems = YAML.load_file(File.expand_path(File.join('..', 'data', 'poems.yml'), __FILE__))
			@poem = poems[id-1]
		end

		def full
			@poem["poem"]
		end

		def first
			poem_data = @poem["poem"].split(" ")
			first = ''
			for i in 0..2
				first << poem_data[i]
			end
			return first
		end

		def last
			poem_data = @poem["poem"].split(" ")
			first = ''
			for i in 3..4
				first << poem_data[i]
			end
			return first
		end

		def comment
			@poem['comment']
		end
	end

	class Poet
		def initialize(id)
			poets = YAML.load_file(File.expand_path(File.join('..', 'data', 'poets.yml'), __FILE__))
			@poet = poets[id-1]
		end

		def name
			@poet['name']
		end

		def period
			@poet['period']
		end

		def info
			@poet['info']
		end
	end
end
