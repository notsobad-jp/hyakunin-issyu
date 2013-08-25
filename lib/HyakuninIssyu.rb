require "HyakuninIssyu/version"
require "yaml"

class HyakuninIssyu
	def initialize(id)
		@poem = Poem.new(id)
		@poet = Poet.new(id)
	end

	def poem
		@poem
	end

	def poet
		@poet
	end

	class Poem
		def initialize(id)
			poems = YAML.load_file(File.expand_path(File.join('..', 'data', 'poems.yml'), __FILE__))
			@poem = poems[id-1]
		end

		def kana
			@poem["kana"]
		end

		def kanji
			@poem["poem"]
		end

		def full
			Full.new(@poem)
		end

		def first
		  First.new(@poem)
		end

		def last
			Last.new(@poem)
		end

		def comment
			@poem['comment']
		end

		class Full
			def initialize(data)
				@full_kanji = data["poem"]
				@full_kana  = data["kana"]
			end

			def kanji
				@full_kanji
			end

			def kana
				@full_kana
			end
		end

		class First
			def initialize(data)
				kanji_data = data["poem"].split(" ")
				@first_kanji = ''
				for i in 0..2
					@first_kanji << kanji_data[i]
				end

				kana_data = data["kana"].split("　")
				@first_kana = kana_data[0]
			end

			def kana
				@first_kana
			end

			def kanji
				@first_kanji
			end
		end

		class Last
			def initialize(data)
				kanji_data = data["poem"].split(" ")
				@last_kanji = ''
				for i in 3..4
					@last_kanji << kanji_data[i]
				end

				kana_data = data["kana"].split("　")
				@last_kana = kana_data[1]
			end

			def kana
				@last_kana
			end

			def kanji
				@last_kanji
			end
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
