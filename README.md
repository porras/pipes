# Understanding Unix pipes with Ruby

Examples from my talk about this topic in [Conferencia Rails 2016](http://conferenciaror.es/) in Madrid on October 2016. The slides I used are here:

[![slides](https://speakerd.s3.amazonaws.com/presentations/68088abef0804f53b21c88f7da2484ab/preview_slide_4.jpg)](https://speakerdeck.com/porras/understanding-unix-pipes-with-ruby)

There are two groups of examples:

## Examples for running pipelines on the shell

We saw trhree examples of sending output through stdout from a Ruby script and reading it from stdin from another one. They're under `shell/1`, `shell/2`, and `shell/3`. To run them:

    $ ruby 1/1.rb | ruby 1/2.rb

And so on.

## Ruby examples

We implemented three *emulations* of pipes inside a single Ruby process. They're `ruby/1.rb`, `ruby/2.rb`, and `ruby/3.rb`. To run them, obviously:

    $ ruby ruby/1.rb

And so on.

### Bonus Track

There's a fourth one that I didn't show, `ruby/refactor.rb`. It's functionally identical to the third one (the one with threads) but factors out the common bits of the implementation to a `MyPipe` class.

## Ruby version

All is tested with Ruby 2.3.1. The examples with threads won't work on anything older than 2.3.0 (due to lack of [`Queue#close`](http://www.rubydoc.info/stdlib/core/Queue#close-instance_method)). The rest will *probably* work with any not-too-old Ruby, but I haven't tested it with anything but 2.3.1.
