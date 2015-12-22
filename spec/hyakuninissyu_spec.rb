require "spec_helper.rb"

describe HyakuninIssyu do
	before { @data = HyakuninIssyu.new }
	describe 'Poem' do
		before { @poems = YAML.load_file(File.expand_path(File.join('..', '..', 'config', 'poems.yml'), __FILE__)) }

		describe '#id?' do
			context 'when provided proper id' do
				before { @poem = @data.poem(3) }
				it {
					@poem.id.should be_true
				}
			end

			context 'when provided unproper id' do
				before { @poem = @data.poem(101) }
				it {
					@poem.should be_false
				}
			end

			context 'when provided no id' do
				before { @poem = @data.poem }
				it {
					@poem.should be_false
				}
			end
		end

		context 'with proper poem data' do
			before { @poem = @data.poem(10) }

			context 'when showing full part' do
				describe '#kana' do
					it {
						@poem.kana.should include_kana
					}

					it {
						@poem.kana.split(//u).size.should eq(32)
					}
				end

				describe '#kanji' do
					it {
						@poem.kanji.should include_kanji
					}

					it {
						@poem.kanji.split(/ /).size.should eq(5)
					}
				end

				describe '#en' do
					it {
						@poem.en.should be_english
					}
				end

				describe '#comment' do
					it {
						@poem.comment.should include_kanji
					}
				end

			end

			context 'when showing the first part' do
				describe '#kana' do
					it {
						@poem.first.kana.should include_kana
					}

					it {
						@poem.first.kana.split(//u).size.should eq(17)
					}
				end

				describe '#kanji' do
					it {
						@poem.first.kanji.should include_kanji
					}
				end

				describe '#en' do
					it {
						@poem.first.en.should be_english
					}
				end
			end

			context 'when showing the last part' do
				describe '#kana' do
					it {
						@poem.last.kana.should include_kana
					}

					it {
						@poem.last.kana.split(//u).size.should eq(14)
					}
				end

				describe '#kanji' do
					it {
						@poem.last.kanji.should include_kanji
					}
				end

				describe '#en' do
					it {
						@poem.last.en.should be_english
					}
				end
			end
		end
	end

	describe 'Poet' do
		before { @poets = YAML.load_file(File.expand_path(File.join('..', '..', 'config', 'poets.yml'), __FILE__)) }

		describe '#id?' do
			context 'when provided proper id' do
				before { @poet = @data.poet(3) }
				it {
					@poet.id.should be_true
				}
			end

			context 'when provided unproper id' do
				before { @poet = @data.poet(101) }
				it {
					@poet.should be_false
				}
			end

			context 'when provided no id' do
				before { @poet = @data.poet }
				it {
					@poet.should be_false
				}
			end
		end

		context 'with proper poet data' do
			before { @poet = @data.poet(10) }

			describe '#name' do
				describe '#ja' do
					it {
						@poet.name.ja.should include_kanji
					}
				end

				describe '#en' do
					it {
						@poet.name.en.should be_english
					}
				end
			end

			describe '#period' do
				it {
					@poet.period.should match(/-/)
				}
			end

			describe '#male?' do
				context 'when poet is male' do
					before { @poet = @data.poet(1) }
					it {
						@poet.male?.should be_true
					}
				end

				context 'when poet is female' do
					before { @poet = @data.poet(2) }
					it {
						@poet.male?.should be_false
					}
				end
			end

			describe '#female?' do
				context 'when poet is male' do
					before { @poet = @data.poet(1) }
					it {
						@poet.female?.should be_false
					}
				end

				context 'when poet is female' do
					before { @poet = @data.poet(2) }
					it {
						@poet.female?.should be_true
					}
				end
			end

			describe '#monk?' do
				context 'when poet is monk' do
					before { @poet = @data.poet(8) }
					it {
						@poet.monk?.should be_true
					}
				end

				context 'when poet is not monk' do
					before { @poet = @data.poet(1) }
					it {
						@poet.monk?.should be_false
					}
				end
			end

			describe '#semimaru?' do
				context 'when poet is semimaru' do
					before { @poet = @data.poet(10) }
					it {
						@poet.semimaru?.should be_true
					}
				end

				context 'when poet is not semimaru' do
					before { @poet = @data.poet(1) }
					it {
						@poet.semimaru?.should be_false
					}
				end
			end
		end
	end
end
