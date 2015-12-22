require "yaml"

class HyakuninIssyu
	@@poems = YAML.load_file(File.expand_path(File.join('..', '..', 'config', 'poems.yml'), __FILE__))
	@@poets = YAML.load_file(File.expand_path(File.join('..', '..', 'config', 'poets.yml'), __FILE__))

	def self.find(id=nil)
		return false if id.nil? || id<1 || id>100
		Data.new(id)
	end

	def self.all
		all = []
		for i in 1..100
			all << self.find(i)
		end
		all
	end

	def self.sample(n=1)
		n = 100 if n > 100
		ids = (1..100).to_a.sample(n)
		ids.each do |i|
			sample << self.find(i)
		end
		sample
	end

	class Data < self
		def initialize(id)
			@id = id
		end

		def poem
			Poem.new(@id)
		end

		def poet
			Poet.new(@id)
		end
	end

	class Poem < self
		def initialize(id)
			@poem = @@poems[id-1]
		end

		def id
			@poem['id']
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

	class Poet < self
		def initialize(id)
			@poet = @@poets[id-1]
		end

		def id
			@poet['id']
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
