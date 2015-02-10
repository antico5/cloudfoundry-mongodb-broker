$LOAD_PATH.unshift File.expand_path("../..", __FILE__)

ENV['RACK_ENV'] = 'test'

require 'app'
require 'rack/test'

RSpec.configure do |config|
  config.before :each do
    basic_authorize ENV['BASIC_USER'], ENV['BASIC_PASS']
  end
end
