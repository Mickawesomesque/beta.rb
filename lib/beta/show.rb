module Beta
  class Show
    def initialize(json)
      @json = json
    end

    def banner
      @json[:banner]
    end

    def description
      @json[:description]
    end

    def duration
      @json[:duration]
    end

    def genres
      @json[:genres]
    end

    def id_thetvdb
      @json[:id_thetvdb]
    end

    def network
      @json[:network]
    end

    def note
      @json[:note]
    end

    def seasons
      @json[:seasons]
    end

    def status
      @json[:status]
    end

    def title
      @json[:title]
    end

    def url
      @json[:url]
    end
  end
end
