require 'securerandom'
require 'mongo'
require 'credentials'

class MongoServer
  attr_accessor :host, :port, :user, :pass

  def initialize options
    options.each do |key, val|
      send "#{ key }=", val
    end
  end

  def create_user name
    credentials = Credentials.new user: name, pass: random_pass,
                                  host: host, port: port, db: name
    client.db(name).add_user(name, credentials.pass, false, roles: [ "readWrite" ])
    credentials.to_h
  end

  private

  def random_pass
    SecureRandom.hex 20
  end

  def client
    @client ||= Mongo::MongoClient.new(host, port).tap do |client|
      client.db("admin").authenticate(user, pass)
    end
  end
end
