TwilioInterceptor
====

`TwilioInterceptor` is a very quick and dirty way to intercept Twilio API interactions (just SMS messages right now) in development, much like [MailCatcher](http://mailcatcher.me).

This is very quick and dirty and experimental. You probably shouldn't use it (but I welcome any contributions).

Usage
---

For example, in a Rails app's initializer:

    TwilioInterceptor.intercept do |options|
      Rails.logger.info "Sent an SMS to #{options[:to]} (#{options[:body]})"
    end

The `options` arg to the block you give is the same argument hash passed to `Twilio::REST::Messages.create` (i.e. it should contain `:to`, `:from` and `:body` keys).
