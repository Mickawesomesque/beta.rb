module Beta
  class PictureFactory
    def initialize(bs)
      @bs = bs
    end

    def find_badge(name)
      self.get("/pictures/badge/#{name}")
    end

    def find_episode(show, params = {})
      self.get("/pictures/episode/#{show}", params)
    end

    def find_member(login)
      self.get("/pictures/member/#{login}")
    end

    def find_show(name)
      self.get("/pictures/show/#{name}")
    end

    def get(path, params = {})
      params[:answer_format] = :jpg
      uri = @bs.make_path(path, params)
      Beta::log("GET " + uri)
      Net::HTTP.get(URI.parse(uri))
    end
  end
end
