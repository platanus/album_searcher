class Finder
  attr_accessor :results, :credentials

  def initialize
    @results = []
    @credentials = { key: 'spotify-key' }
  end

  # LastFM album search docs
  # http://www.last.fm/api/show/album.search

  def search(keyword)
    return [] if keyword.strip == '' || keyword.index(/\s/) != nil

    result = HTTParty.get("https://api.spotify.com/v1/search?q=#{keyword}&type=album")
    json = JSON.parse(result.body)
    extract_albums_from(json)
  end

  # Sample search format
  # http://ws.audioscrobbler.com/2.0/?method=album.search&album=orphan+songs&api_key=35194898d36e6c4797ac954fe1b1ca76&format=json

  def extract_albums_from(json)
    json['albums']['items'].collect do |result|
      # todo: move this to album
      Album.new name: result['name'],
                artist: result['artist'],
                url: result['uri'],
                mbid: result['mbid'],
                art: result['images'].first['url']
    end
  end

end
