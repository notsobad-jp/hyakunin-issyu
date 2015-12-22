# hyakunin-issyu
[![Build Status](https://travis-ci.org/Tomomichi/HyakuninIssyu.png?branch=master)](https://travis-ci.org/Tomomichi/HyakuninIssyu)
[![Dependency Status](https://gemnasium.com/Tomomichi/HyakuninIssyu.png)](https://gemnasium.com/Tomomichi/HyakuninIssyu)

All about Hyakunin-Issyu, 100 poems by 100 poets.


## Installation

Add this line to your application's Gemfile:

    gem 'hyakunin-issyu'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install hyakunin-issyu

## Usage

    > irb
    require "HyakuninIssyu"


### Poem | 歌情報
To retrieve the 64th poem (it's one of my favourite), you can do:

    poem = HyakuninIssyu.find(64).poem

    poem.kanji   #=> "朝ぼらけ 宇治の川霧 たえだえに あらはれわたる 瀬々の網代木"
    poem.kana   #=> "あさぼらけうじのかわぎりたえだえに　あらはれわたるせぜのあじろぎ"
    poem.en   #=> "In the early dawn When the mists on Uji River Slowly lift and clear,  From the shallows to the deep, The stakes of fishing nets appear."

    # Retrieve only the first half of the poem
    poem.first.kanji   #=> "朝ぼらけ宇治の川霧たえだえに"
    poem.first.kana   #=> "あさぼらけうじのかわぎりたえだえに"
    poem.first.en   #=> "In the early dawn When the mists on Uji River Slowly lift and clear,"

    # Retrieve only the last half of the poem
    poem.last.kanji   #=> "あらはれわたる瀬々の網代木"
    poem.last.kana   #=> "あらはれわたるせぜのあじろぎ"
    poem.last.en   #=> "From the shallows to the deep, The stakes of fishing nets appear."

    poem.comment   #=> "「朝ぼらけ」は夜明けであたりがほのぼのと明るくなってくる頃..."

### Poet | 歌人情報
To retrieve the poet info for the same poem, you can do:

    poet = HyakuninIssyu.find(64).poet

    poet.name.ja   #=> "権中納言定頼"
    poet.name.en   #=> "Fujiwara no Sadayori"
    poet.period   #=> "995-1045"
    poet.info   #=> "本名は藤原定頼(ふじわらの さだより)。平安時代中期の公家・歌人..."

    poet.male?   #=> true
    poet.female?   #=> false
    poet.monk?   #=> false
    poet.semimaru?   #=> false


### Retrieve all the data
To retrieve all 100 poems, you can do:

    poems = HyakuninIssyu.all
    poems[64].poem.kanji   #=> "朝ぼらけ 宇治の川霧 たえだえに あらはれわたる 瀬々の網代木"
    poems[64].poem.kana   #=> "あさぼらけうじのかわぎりたえだえに　あらはれわたるせぜのあじろぎ"
    poems[64].poem.en   #=> "In the early dawn When the mists on Uji River Slowly lift and clear,  From the shallows to the deep, The stakes of fishing nets appear."
		...

    poems[64].poet.name.ja   #=> "権中納言定頼"
    poems[64].poet.name.en   #=> "Fujiwara no Sadayori"
    poems[64].poet.period   #=> "995-1045"
		...

As normal arrays, you can retrieve random poems as you like:

    sample_poems = HyakuninIssyu.sample
    #=> [#<HyakuninIssyu::Data:0x007fcffc245918 @id=76>]

    sample_poems = HyakuninIssyu.sample(5)
    => [#<HyakuninIssyu::Data:0x007fcffc245918 @id=23>, #<Hyakunin...]


## Use image files of the cards
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
