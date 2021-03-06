class Genre

  extend Concerns::Findable
  attr_accessor :name, :songs
  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.all
    @@all
  end

  def save
    @@all << self
    self
  end

  def self.create(name)
    self.new(name).save
  end

  def self.destroy_all
    @@all.clear
  end

  def add_song(song)
    song.genre = self if song.genre == nil
    @songs << song unless @songs.include?(song)
    song
  end

  def artists
    @songs.map{|song| song.artist}.uniq
  end

end