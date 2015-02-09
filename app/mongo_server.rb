require 'mongo'
require 'pry'

class MongoServer
  attr_accessor :host, :port, :user, :pass

  def initialize options
    options.each do |key, val|
      send "#{ key }=", val
    end
  end

  def create_user name
    client.db(name).eval("db.createUser({})")
  end

  private

  def client
    @client ||= Mongo::MongoClient.new host, port
  end
end
