require 'pry'
class Song
  attr_accessor :name, :artist_name
  @@all = []
  
  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = self.new
    song.save
    song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.new
    song.name = name
    self.all << song
    song
  end

  def self.find_by_name(name)
    @@all.each do |song|
      if song.name == name
        return song
      end 
    end
    nil
  end 

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create_by_name(name)
  end

  def self.alphabetical
    @@all.sort_by{|song| song.name}
  end

  def self.new_from_filename(filename)
    song_array = filename.split(" - ")
    name = song_array[1][0..-5]
    artist_name = song_array[0]

    song = self.new
    song.name = name
    song.artist_name = artist_name
    song
  end
  
  def self.create_from_filename(filename)
    song_array = filename.split(" - ")
    name = song_array[1][0..-5]
    artist_name = song_array[0]

    song = self.create
    song.name = name
    song.artist_name = artist_name
    song
  end
    

  def self.destroy_all
    @@all.clear
  end



end
