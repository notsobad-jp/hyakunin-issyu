require "spec_helper.rb"

describe HyakuninIssyu do
	describe 'Poem' do
		before { @poems = YAML.load_file(File.expand_path(File.join('..', '..', 'lib', 'data', 'poems.yml'), __FILE__)) }

		describe '#id?' do
			context 'when provided proper id' do
				before { @poem = HyakuninIssyu.new(3) }
				it {
					@poem.poem.id.should be_true
				}
			end

			context 'when provided unproper id' do
				before { @poem = HyakuninIssyu.new(101) }
				it {
					@poem.poem.should be_false
				}
			end

			context 'when provided no id' do
				before { @poem = HyakuninIssyu.new }
				it {
					@poem.poem.id.should be_true
				}

				it {
					@poem.poem.id.should eq(1)
				}
			end
		end

		describe '#list' do
			before { @poem = HyakuninIssyu.new }
			it {
				@poem.poem.list.should have(100).items
			}
		end

		context 'when showing full part' do
			before { @poem = HyakuninIssyu.new(10) }

			describe '#kana' do
				it {
					@poem.poem.kana.should include_kana
				}

				it {
					@poem.poem.kana.split(//u).size.should eq(32)
				}
			end

			describe '#kanji' do
				it {
					@poem.poem.kanji.should include_kanji
				}

				it {
					@poem.poem.kanji.split(/ /).size.should eq(5)
				}
			end

			describe '#en' do
				it {
					@poem.poem.en.should be_english
				}
			end

			describe '#comment' do
				it {
					@poem.poem.comment.should include_kanji
				}
			end

		end

		context 'when showing the first part' do
			describe '#kana' do
				before { @poem = HyakuninIssyu.new(10) }
				it {
					@poem.poem.first.kana.should include_kana
				}

				it {
					@poem.poem.first.kana.split(//u).size.should eq(17)
				}
			end

			describe '#kanji' do
				before { @poem = HyakuninIssyu.new(10) }
				it {
					@poem.poem.first.kanji.should include_kanji
				}
			end

			describe '#en' do
				before { @poem = HyakuninIssyu.new(10) }
				it {
					@poem.poem.first.en.should be_english
				}
			end
		end

		context 'when showing the last part' do
			describe '#kana' do
				before { @poem = HyakuninIssyu.new(10) }
				it {
					@poem.poem.last.kana.should include_kana
				}

				it {
					@poem.poem.last.kana.split(//u).size.should eq(14)
				}
			end

			describe '#kanji' do
				before { @poem = HyakuninIssyu.new(10) }
				it {
					@poem.poem.last.kanji.should include_kanji
				}
			end

			describe '#en' do
				before { @poem = HyakuninIssyu.new(10) }
				it {
					@poem.poem.last.en.should be_english
				}
			end
		end
	end

	describe 'Poet' do
		before { @poets = YAML.load_file(File.expand_path(File.join('..', '..', 'lib', 'data', 'poets.yml'), __FILE__)) }

		describe '#id?' do
			context 'when provided proper id' do
				before { @poet = HyakuninIssyu.new(3) }
				it {
					@poet.poet.id.should be_true
				}
			end

			context 'when provided unproper id' do
				before { @poet = HyakuninIssyu.new(101) }
				it {
					@poet.poet.should be_false
				}
			end

			context 'when provided no id' do
				before { @poet = HyakuninIssyu.new }
				it {
					@poet.poet.id.should be_true
				}

				it {
					@poet.poet.id.should eq(1)
				}
			end
		end

		describe '#list' do
			before { @poet = HyakuninIssyu.new }
			it {
				@poet.poet.list.should have(100).items
			}
		end

		describe '#name' do
			before { @poet = HyakuninIssyu.new }

			describe '#ja' do
				it {
					@poet.poet.name.ja.should include_kanji
				}
			end

			describe '#en' do
				it {
					@poet.poet.name.en.should be_english
				}
			end
		end

		describe '#period' do
			before { @poet = HyakuninIssyu.new }
			it {
				@poet.poet.period.should match(/-/)
			}
		end

		describe '#male?' do
			context 'when poet is male' do
				before { @poet = HyakuninIssyu.new(1) }
				it {
					@poet.poet.male?.should be_true
				}
			end

			context 'when poet is female' do
				before { @poet = HyakuninIssyu.new(2) }
				it {
					@poet.poet.male?.should be_false
				}
			end
		end

		describe '#female?' do
			context 'when poet is male' do
				before { @poet = HyakuninIssyu.new(1) }
				it {
					@poet.poet.female?.should be_false
				}
			end

			context 'when poet is female' do
				before { @poet = HyakuninIssyu.new(2) }
				it {
					@poet.poet.female?.should be_true
				}
			end
		end

		describe '#monk?' do
			context 'when poet is monk' do
				before { @poet = HyakuninIssyu.new(8) }
				it {
					@poet.poet.monk?.should be_true
				}
			end

			context 'when poet is not monk' do
				before { @poet = HyakuninIssyu.new(1) }
				it {
					@poet.poet.monk?.should be_false
				}
			end
		end

		describe '#semimaru?' do
			context 'when poet is semimaru' do
				before { @poet = HyakuninIssyu.new(10) }
				it {
					@poet.poet.semimaru?.should be_true
				}
			end

			context 'when poet is not semimaru' do
				before { @poet = HyakuninIssyu.new(1) }
				it {
					@poet.poet.semimaru?.should be_false
				}
			end
		end
	end
end

