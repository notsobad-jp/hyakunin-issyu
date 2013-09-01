# HyakuninIssyu
[![Build Status](https://travis-ci.org/Tomomichi/HyakuninIssyu.png?branch=master)](https://travis-ci.org/Tomomichi/HyakuninIssyu)
[![Dependency Status](https://gemnasium.com/Tomomichi/HyakuninIssyu.png)](https://gemnasium.com/Tomomichi/HyakuninIssyu)

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
First, you need to make the instance of HyakuninIssyu class.

    data = HyakuninIssyu.new

Then use this to retrieve poem and poet data.

###Poem Info | 歌情報の取得
When retrieving the 64th poem (it's one of my favourite), what you can do is:

		poem_data = data.poem(64)

    poem_data.kanji   #=> "朝ぼらけ 宇治の川霧 たえだえに あらはれわたる 瀬々の網代木"
    poem_data.kana   #=> "あさぼらけうじのかわぎりたえだえに　あらはれわたるせぜのあじろぎ"
    poem_data.en   #=> "In the early dawn When the mists on Uji River Slowly lift and clear,  From the shallows to the deep, The stakes of fishing nets appear."

    poem_data.first.kanji   #=> "朝ぼらけ宇治の川霧たえだえに"
    poem_data.first.kana   #=> "あさぼらけうじのかわぎりたえだえに"
    poem_data.first.en   #=> "In the early dawn When the mists on Uji River Slowly lift and clear,"

    poem_data.last.kanji   #=> "あらはれわたる瀬々の網代木"
    poem_data.last.kana   #=> "あらはれわたるせぜのあじろぎ"
    poem_data.last.en   #=> "From the shallows to the deep, The stakes of fishing nets appear."

    poem_data.comment   #=> "「朝ぼらけ」は夜明けであたりがほのぼのと明るくなってくる頃..."

###Poet Info | 歌人情報の取得
To retrieve the poet info for the same poem,

		poet_data = data.poet(64)

    poet_data.name.ja   #=> "権中納言定頼"
    poet_data.name.en   #=> "Fujiwara no Sadayori"
    poet_data.period   #=> "995-1045"
    poet_data.info   #=> "本名は藤原定頼(ふじわらの さだより)。平安時代中期の公家・歌人..."

    poet_data.male?   #=> true
    poet_data.female?   #=> false
    poet_data.monk?   #=> false
    poet_data.semimaru?   #=> false

###List of poems and poets | データをまとめて扱うとき
If you want to list the poems and poets, you can use "poems" and "poets" method to retrieve the raw data of them.

    data.poems  #=>[{"id"=>1, "poem"=>{"kanji"=>"秋の田の..", ...}}, {"id"=>2, "poem"=>{"kanji"=>"..."}}, ...]
    data.poets  #=>[{"id"=>1, "name"=>{"ja"=>"天智天皇", ...}}, {"id"=>2, "name"=>{"kanji"=>"..."}}, ...]

Use these to retrieve many poems and poets at the same time.


##Use image files of the cards
Image files of the Hyakunin-Issyu cards are installed in this gem.
If you wanna use these, it's better to copy them to your project directory.

The rake task for this is set. Just run the following:

    rake HyakuninIssyu:install_img['IMG_PATH']

then "hyakunin-issyu" directory will be created under your IMG_PATH, and
all the images will be copied there.


**All the images used in this gem are from Wikipedia and they're under the public license.


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
