require 'require_all'

$LOAD_PATH.unshift File.expand_path "..", __FILE__

if %w{ development test }.include? ENV['RACK_ENV']
  require 'pry'
  require 'dotenv'

  Dotenv.load
end

require_all 'lib'

