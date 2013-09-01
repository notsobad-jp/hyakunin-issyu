require "HyakuninIssyu/version"
require "yaml"

class HyakuninIssyu
	def initialize(id=1)
		return false if id<1 || id>100
		@poem = Poem.new(id)
		@poet = Poet.new(id)
	end

	def self.img_path
    File.expand_path("../../img", __FILE__)
  end

	def poem
		@poem
	end

	def poet
		@poet
	end

	class Poem
		def initialize(id)
			@poems = YAML.load_file(File.expand_path(File.join('..', 'data', 'poems.yml'), __FILE__))
			@poem = @poems[id-1]
		end

		def id
			@poem['id']
		end

		def list
			list = Array.new
			for i in 0..99
				list << @poems[i]['poem']['kanji']
			end
			return list
		end

		def kana
			@poem["poem"]["kana"]
		end

		def kanji
			@poem["poem"]["kanji"]
		end

		def en
			@poem["poem"]["en"]
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

		class First
			def initialize(data)
				kanji_data = data["poem"]["kanji"].split(" ")
				@first_kanji = ''
				for i in 0..2
					@first_kanji << kanji_data[i]
				end

				kana_data = data["poem"]["kana"].split("　")
				@first_kana = kana_data[0]

				en_data = data["poem"]["en"].split("  ")
				@first_en = en_data[0]
			end

			def kana
				@first_kana
			end

			def kanji
				@first_kanji
			end

			def en
				@first_en
			end
		end

		class Last
			def initialize(data)
				kanji_data = data["poem"]["kanji"].split(" ")
				@last_kanji = ''
				for i in 3..4
					@last_kanji << kanji_data[i]
				end

				kana_data = data["poem"]["kana"].split("　")
				@last_kana = kana_data[1]

				en_data = data["poem"]["en"].split("  ")
				@last_en = en_data[1]
			end

			def kana
				@last_kana
			end

			def kanji
				@last_kanji
			end

			def en
				@last_en
			end
		end
	end

	class Poet
		def initialize(id)
			@poets = YAML.load_file(File.expand_path(File.join('..', 'data', 'poets.yml'), __FILE__))
			@poet = @poets[id-1]
		end

		def id
			@poet['id']
		end

		def list
			list = Array.new
			for i in 0..99
				list << @poets[i]['name']['ja']
			end
			return list
		end

		def name
			Name.new(@poet)
		end

		class Name
			def initialize(data)
				@name = data['name']
			end

			def ja
				@name['ja']
			end

			def en
				@name['en']
			end
		end

		def period
			@poet['period']
		end

		def info
			@poet['info']
		end

		def male?
			@poet['sex'] == 1
		end

		def female?
			@poet['sex'] == 2
		end

		def monk?
			@poet['monk'] == 1
		end

		def semimaru?
			@poet['id'] == 10
		end
	end
end
