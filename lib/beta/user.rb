module Beta
  class User
    def initialize(bs, json)
      @bs, @json = bs, json
    end

    def add_friend(login)
      if @bs.connected?
        @bs.get("/members/add/#{login}")
      else
        raise Beta::Error.new(nil, "You must be logged in to do that")
      end
    end

    def avatar
      @json[:avatar]
    end

    def badges
      @badges ||= @bs.get("/members/badges/#{self.login}")[:badges]
    end

    def block(login)
      @bs.get("/members/block/#{login}")
    end

    def delete_friend(login)
      if @bs.connected?
        @bs.get("/members/delete/#{login}")
      else
        raise Beta::Error.new(nil, "You must be logged in to do that")
      end
    end

    def friends
      @friends ||= @bs.get("/members/friends/#{self.login}")
      @friends[:friends]
    end

    def friends_blocked
      @friends ||= @bs.get("/members/friends/#{self.login}")
      @friends[:blocked]
    end

    def friends_requests
      @friends ||= @bs.get("/members/friends/#{self.login}")
      @friends[:requests]
    end

    def login
      @json[:login]
    end

    def mark_downloaded(show_url, season, episode)
      @bs.get("/members/downloaded/#{show_url}", season, episode)
    end

    def note_episode(show_url, season, episode, note)
      @bs.get("/members/note/#{show_url}", season: season, episode: episode, note: note)
    end

    def note_show(show_url, note)
      self.note_episode(show_url, 0, 0, note)
    end

    def shows
      @json[:shows]
    end

    def stats
      @json[:stats]
    end

    def unblock(login)
      @bs.get("/members/ublock/#{login}")
    end

    def watch(show_url, season, episode, note = nil)
      params = { season: season, episode: episode }
      params[:note] = note unless note.nil?
      @bs.get("/members/watched/#{show_url}", params)
    end
  end
end
