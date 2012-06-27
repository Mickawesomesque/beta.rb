module Beta
  class UserFactory
    def initialize(bs)
      @bs = bs
    end

    def find(login, show_data = true, since = 0)
      params = {nodata: show_data ? 0 : 1, since: since}
      json = @bs.get("/members/infos/#{login}", params)
      json[:member]# .symbolize_keys!

      raise Beta::Error.new(json, "Utilisateur introuvable") if json[:member][:login].nil?
      User.new(@bs, json[:member])
    end
  end
end
