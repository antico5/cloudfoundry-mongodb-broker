require 'grape'
require 'yaml'
require 'mongo_server'

class MongoBroker < Grape::API
  version 'v2', using: :path
  format :json

  helpers do
    def server
      MongoServer.new host: ENV["MONGO_HOST"],
                      port: ENV["MONGO_PORT"],
                      user: ENV["MONGO_USER"],
                      pass: ENV["MONGO_PASS"]
    end
  end

  http_basic do |username, password|
    [username, password] == [ ENV["BASIC_USER"], ENV["BASIC_PASS"] ]
  end

  get '/catalog' do
    YAML.load_file File.join(Dir.pwd, "config", "catalog.yml")
  end

  resource '/service_instances' do
    route_param :service_id do
      put do
        {}
      end
      resource '/service_bindings' do
        route_param :binding_id do
          put do
            begin
              status 201
              server.create_user params[:binding_id]
            rescue ExistingUser
              status 200
              {}
            end
          end
        end
      end
    end
  end

end

