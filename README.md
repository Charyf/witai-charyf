# Wit::Nlp::Charyf

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/wit/nlp/charyf`. To experiment with that code, run `bin/console` for an interactive prompt.

TODO: Delete this and the text above, and describe your gem

## Installation

### New application
When generating new charyf app, you can install wit intent processor automatically by specifying
``charyf new [app_nane] --intent-processors=wit``

### Existing application

To install wit processor to existing charyf application
Add gem to your gemfile
```ruby
gem 'adapt-charyf', '>= 0.2.4'
```

Edit *enabled_intent_processors* inside *config/application.rb*
```ruby
 config.enabled_intent_processors = [:wit, etc...]
```

Add the require inside inside *config/load.rb*
```ruby
require 'witai/charyf'
```

### Configure

If you dont set your api keys for wit application, the initialization will throw  
``/Users/rycco/.rvm/gems/ruby-2.2.2@charyf/gems/witai-charyf-0.2.0/lib/witai/charyf/processor.rb:18:in `initialize': WitAI::Charyf.api_key has not been set (WitAI::Charyf::Processor::NoKeyProvided)``

To configure create file *config/initializers/witai.rb* and set the API key
```ruby
require 'witai/charyf'

WitAI::Charyf::Extension.configure do
  config.api_key = 'SOME_CLIENT_API_KEY'
end     
```

## Usage

To define intent visit http://wit.ai/ and define an intent and entities inside your application.
Don't forget to wait for training to finish.

Define routing as usually using *config/routes.rb*

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Wit::Nlp::Charyf project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/wit-nlp-charyf/blob/master/CODE_OF_CONDUCT.md).
