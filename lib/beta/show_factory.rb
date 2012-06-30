module Beta
  class ShowFactory
    def initialize(bs)
      @bs = bs
    end

    def all
      json = @bs.get("/shows/display/all")
      raise Beta::Error.new(json, "Bad format for the answer (API)") unless json.has_key?(:shows)

      shows = []
      json[:shows].each do |key, value|
        shows << Show.new({id: key, title: value[:title], url: value[:url]})
      end
      shows
    end

    def find(name)
      json = @bs.get("/shows/display/#{name}")[:show]
      Show.new(json)
    end
  end
end
