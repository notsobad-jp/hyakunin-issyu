# HyakuninIssyu
[![Build Status](https://travis-ci.org/Tomomichi/HyakuninIssyu.png?branch=master)](https://travis-ci.org/Tomomichi/HyakuninIssyu)
[![Dependency Status](https://gemnasium.com/Tomomichi/HyakuninIssyu.png)](https://gemnasium.com/Tomomichi/HyakuninIssyu)
[![Coverage Status](https://coveralls.io/repos/Tomomichi/HyakuninIssyu/badge.png?branch=master)](https://coveralls.io/r/Tomomichi/HyakuninIssyu?branch=master)

"HyakuninIssyu" is a Gem for installing poems and poets info of Hyakunin-Issyu, 100 poems by 100 poets into your apps.
You can take any poems of Hyakunin-Issyu, poets info and a commentary on it, in addition to the feature to take the first or last half of the poem.
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
When retrieving the 64th poem (it's one of my favourite),
make the instance of HyakuninIssyu class with its poem id first.

    data = HyakuninIssyu.new(64)

If you don't pass the poem id, it retrieve the data of the first poem by Tenchi-Tennoh.

###Poem Info | 歌情報の取得
To retrieve the poem info,

    data.poem.kanji   #=> "朝ぼらけ 宇治の川霧 たえだえに あらはれわたる 瀬々の網代木"
    data.poem.kana   #=> "あさぼらけうじのかわぎりたえだえに　あらはれわたるせぜのあじろぎ"

    data.poem.first.kanji   #=> "朝ぼらけ宇治の川霧たえだえに"
    data.poem.first.kana   #=> "あさぼらけうじのかわぎりたえだえに"

    data.poem.last.kanji   #=> "あらはれわたる瀬々の網代木"
    data.poem.last.kana   #=> "あらはれわたるせぜのあじろぎ"

    data.poem.comment   #=> "「朝ぼらけ」は夜明けであたりがほのぼのと明るくなってくる頃..."

    data.poem.list   #=> ["秋の田の かりほの庵の 苫をあらみ わが衣手は 露にぬれつつ", "春過ぎて..."]

"list" method returns all the poem data in array.

###Poet Info | 歌人情報の取得
To retrieve the poet info for the same poem,

    data.poet.name   #=> "権中納言定頼"
    data.poet.period   #=> "995-1045"
    data.poet.info   #=> "本名は藤原定頼(ふじわらの さだより)。平安時代中期の公家・歌人..."
    data.poet.sex   #=> 1
    data.poet.male?   #=> true
    data.poet.female?   #=> false
    data.poet.monk?   #=> false
    data.poet.list   #=> ["天智天皇", "持統天皇", "柿本人麻呂", ... "]

"list" method returns all the poet names in array.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
