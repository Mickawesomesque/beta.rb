require "digest/md5"

module Beta
  class Base
    API = "http://api.betaseries.com"

    def initialize(api_key, format = :json)
      @api_key, @format = api_key, format
      @token = nil
      @login = nil
    end

    def get(path, params = {})
      path = make_path(path, params)
      Beta::log("GET " + path)
      raw = Net::HTTP.get(URI.parse(path))
      json = JSON.parse(raw, :symbolize_names => true)
      raise Beta::Error.new(json, "Mauvais format de reponse (API)") unless json.has_key?(:root)
      if json[:root].has_key?(:code) and json[:root][:code].to_s == "0"
        raise Beta::Error.new(json[:root])
      end
      json[:root]
    end

    def make_path(path, params = {})
      format = params.has_key?(:answer_format) ? params[:answer_format] : @format
      
      path = API + path + ".#{format}?key=#{@api_key}"
      params.each do |key, value|
        path << "&#{key}=#{value}" unless key == :answer_format
      end
      path
    end

    def connected?
      unless @token.nil? or @login.nil?
        if self.get("/members/is_active", token: @token)[:code] == 0
          self.disconnect
          return false
        end
        return true
      end
      false
    end

    def connect(login, password)
      if @token.nil? and @token.nil?
        params = { login: login, password: Digest::MD5.hexdigest(password) }
        json = self.get("/members/auth", params)[:member]
        @token = json[:token]
        @login = json[:login]
      end
    end

    def disconnect
      json = self.get("/members/destroy", token: @token)
      @token = nil
      @login = nil
    end

    def pictures
      Beta::PictureFactory.new(self)
    end

    def shows
      Beta::ShowFactory.new(self)
    end

    def user
      raise Beta::Error.new(nil, "Not logged in") unless self.connected?

      Beta::UserFactory.new(self).find(@login)
    end

    def users
      Beta::UserFactory.new(self)
    end
  end
end
