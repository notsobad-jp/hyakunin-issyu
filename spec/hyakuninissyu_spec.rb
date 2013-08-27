require "spec_helper.rb"

describe HyakuninIssyu do
	describe 'poem with particular poem id' do
		before do
			@id = rand(100)+1
			@test_poem = HyakuninIssyu.new(@id)

			@poems = YAML.load_file(File.expand_path(File.join('..', '..', 'lib', 'data', 'poems.yml'), __FILE__))
			@poets = YAML.load_file(File.expand_path(File.join('..', '..', 'lib', 'data', 'poets.yml'), __FILE__))
		end

		it "should return poem" do
			@test_poem.poem.kanji.should_not be_nil
		end

		it "should return poet" do
			@test_poem.poet.name.ja.should_not be_nil
		end

		it "should return correct poem" do
			correct_poem = @poems[@id-1]["poem"]["kanji"]
			@test_poem.poem.kanji.should eq(correct_poem)
		end

		it "should return correct poet" do
			correct_poet = @poets[@id-1]["name"]["ja"]
			@test_poem.poet.name.ja.should eq(correct_poet)
		end

		it "should return first half of poem" do
			first = @test_poem.poem.first.kanji
			first.should_not be_nil
		end

		it "should return last half of poem" do
			last = @test_poem.poem.last.kanji
			last.should_not be_nil
		end

		it "should return kana without first/last option" do
			kana = @test_poem.poem.kana
			kana.should_not be_nil
		end
	end

	describe 'poem without any particular ids' do
		before do
			@test_poem = HyakuninIssyu.new
		end

		it "should return poem[0]" do
			@test_poem.poem.kanji.should eq('秋の田の かりほの庵の 苫をあらみ わが衣手は 露にぬれつつ')
		end

		it "should return the list of all poems" do
			@test_poem.poem.list.size.should eq(100)
		end

		it "should return the list of all poets" do
			@test_poem.poet.list.size.should eq(100)
		end
	end
end
