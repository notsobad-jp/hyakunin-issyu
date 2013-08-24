require "HyakuninIssyu/version"
require "yaml"

module HyakuninIssyu

	class Poem
		def initialize(id)
			poems = YAML.load_file(File.expand_path(File.join('..', 'data', 'poems.yml'), __FILE__))
			@poem = poems[id-1]
		end

		def full
			@poem.poem
		end

		def first(poem)
			poem.poem
		end

		def last(poem)
			poem.poem
		end

		def comment(poem)
			poem.comment
		end

		def name
		end
	end

	class Poet
		POETS = YAML.load_file(File.expand_path(File.join('..', 'data', 'poets.yml'), __FILE__))
	end
end
