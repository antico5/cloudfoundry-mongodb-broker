require 'require_all'

if %w{ development test }.include? ENV['RACK_ENV']
  require 'pry'
  require 'dotenv'

  Dotenv.load
end

require_all 'lib'


