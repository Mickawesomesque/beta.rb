module Beta
  class UserFactory
    def initialize(bs)
      @bs = bs
    end

    def find(login, show_data = true, since = 0)
      params = {nodata: show_data ? 0 : 1, since: since}
      json = @bs.get("/members/infos/#{login}", params)
      json[:member]

      raise Beta::Error.new(json, "User not found") if json[:member][:login].nil?
      User.new(@bs, json[:member])
    end

    def search(login)
      @bs.get("/members/search", login: login)[:members]
    end
  end
end
