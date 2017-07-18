module TwilioInterceptor
  def self.config
    @config ||= {}
  end

  def self.intercept(run_super = false, &block)
    config[:run_super] = run_super
    config[:block] = block
  end
end

module TwilioInterceptorMonkeyPatch
  def create(*args)
    TwilioInterceptor.config[:block].call(*args)
    super if TwilioInterceptor.config[:run_super]
  end
end

Twilio::REST::Api::V2010::AccountContext::MessageList.class_eval do
  prepend TwilioInterceptorMonkeyPatch
end
