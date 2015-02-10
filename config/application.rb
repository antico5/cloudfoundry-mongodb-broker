require 'require_all'

$LOAD_PATH.unshift File.expand_path "..", __FILE__

case ENV['RACK_ENV']

when 'development'
  require 'pry'
  require 'dotenv'

  Dotenv.load
end

require_all 'lib'

