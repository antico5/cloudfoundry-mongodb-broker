class Credentials
  attr_accessor :host, :port, :user, :pass, :db

  def initialize options
    options.each do |key, val|
      send "#{key}=", val
    end
  end

  def to_h
    { credentials: { uri: uri } }
  end

  private

  def uri
    "mongodb://#{ user }:#{ pass }@#{ host }:#{ port }/#{ db }"
  end
end
