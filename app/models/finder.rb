class Finder
  attr_accessor :results, :credentials

  def initialize
    @results = []
    @credentials = { key: ENV['LASTFM_KEY'] }
  end

  # LastFM album search docs
  # http://www.last.fm/api/show/album.search

  def search(keyword)
    return [] if keyword.strip == '' || keyword.index(/\s/) != nil

    result = HTTParty.get("http://ws.audioscrobbler.com/2.0/?method=album.search&album=#{keyword}&api_key=#{@credentials[:key]}&format=json")
    json = JSON.parse(result.body)
    raise json['message'] if json['error'] != nil
    extract_albums_from(json)
  end

  # Sample search format
  # http://ws.audioscrobbler.com/2.0/?method=album.search&album=orphan+songs&api_key=35194898d36e6c4797ac954fe1b1ca76&format=json

  def extract_albums_from(json)
    json['results']['albummatches']['album'].collect do |result|
      # todo: move this to album
      Album.new name: result['name'],
                artist: result['artitst'],
                url: result['url'],
                mbid: result['mbid'],
                art: result['image'].last['#text']
    end
  end

end
