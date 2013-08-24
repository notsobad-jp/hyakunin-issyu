# HyakuninIssyu

"HyakuninIssyu" is a Gem for installing poems and poets info of Hyakunin-Issyu, 100 poems by 100 poets into your apps.
You can take any poems of Hyakunin-Issyu, poets info and a commentary on it, in addition of the feature to take the first or last half of the poem.
(it may be necessary for building game style Hyakunin-Issyu application)

HyakuninIssyuは、百人一首の歌情報・歌人情報をアプリに取り込むためのGemです。
百首すべての歌の歌人情報や解説に加え、上の句、下の句だけの表示も行うことができます。

## Installation

Add this line to your application's Gemfile:

    gem 'HyakuninIssyu'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install HyakuninIssyu

## Usage

###Poem Info
When retrieving the 64th poem (it's one of my favourite),

    poem = HyakuninIssyu::Poem.new(64)
		poem.full   #=> "朝ぼらけ 宇治の川霧 たえだえに あらはれわたる 瀬々の網代木"
		poem.comment   #=> "「朝ぼらけ」は夜明けであたりがほのぼのと明るくなってくる頃..."
		poem.first   #=> "朝ぼらけ宇治の川霧たえだえに"
		poem.last   #=> "あらはれわたる瀬々の網代木"


###Poet Info
To retrieve the poet info for the same poem,

    poet = HyakuninIssyu::Poet.new(64)
		poet.name   #=> "権中納言定頼"
		poet.period   #=> "995-1045"
    poet.info   #=> "本名は藤原定頼(ふじわらの さだより)。平安時代中期の公家・歌人..."


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
