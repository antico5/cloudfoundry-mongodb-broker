require 'grape'
require 'yaml'

class MongoBroker < Grape::API
  version 'v2', using: :path
  format :json

  helpers do
    def config
      @config ||= YAML.load_file File.join(Dir.pwd, "config", "config.yml")
    end
  end

  http_basic do |username, password|
    [username, password] == [ config["basic_user"], config["basic_pwd"] ]
  end

  get '/catalog' do
    YAML.load_file File.join(Dir.pwd, "config", "catalog.yml")
  end

end

