require 'spec_helper'

describe MongoBroker do
  include Rack::Test::Methods

  def app
    MongoBroker
  end

  def json
    JSON.parse last_response.body
  end

  describe 'GET /v2/catalog' do
    it 'returns 200' do
      get '/v2/catalog'
      expect(last_response.status).to eq(200)
    end

    it 'shows available services and plans' do
      get '/v2/catalog'
      expect(json).to match( hash_including 'services' )
      expect(json['services'].first).to match(
        hash_including *%w{ id name description bindable plans } )
      expect(json['services'].first['plans'].first).to match(
        hash_including *%w{ id name description } )
    end


  end


end
