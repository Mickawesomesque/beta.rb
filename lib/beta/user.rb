module Beta
  class User
    def initialize(bs, json)
      @bs, @json = bs, json
    end

    def avatar
      @json[:avatar]
    end

    def badges
      @badges ||= @bs.get("/members/badges/#{self.login}")[:badges]
    end

    def login
      @json[:login]
    end

    def shows
      @json[:shows]
    end

    def stats
      @json[:stats]
    end
  end
end
