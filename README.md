# BottomlessHash

[firedev.com/2015/bottomless-ruby-hash](http://firedev.com/2015/bottomless-ruby-hash)
[firedev.com/posts/2015/making-bottomless-hash-ruby-gem](http://firedev.com/posts/2015/making-bottomless-hash-ruby-gem)

`BottomlessHash` is a subclass or Ruby Hash that allows you to blindly
assign values without raising errors on missing keys. So you can do chained
assings and accessing keys without checking or using `.try.try.try...`.

```ruby
params = BottomlessHash.new
params[:world][:thailand][:bangkok][:bangna]

params
=> {:world=>{:thailand=>{:bangkok=>{:bangna=>{}}}}}

params[:missing][:key]
=> {} # no error raised
```

### Caveat

It returns an empty hash instead of `nil` if there is no value. Keep that in mind:

```ruby
BottomlessHash.new[:missing][:key]
=> {}
```

### Hash.bottomless

It also adds `#bottomless` method to Ruby `Hash` Class so now you can have
as save version of your hash:

```ruby
yaml.bottomless[:see][:if][:there][:is][:a][:value][:here]
=> {} # apparently there is not
```

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'bottomless_hash'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install bottomless_hash

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

[firedev.com](http://firedev.com)
