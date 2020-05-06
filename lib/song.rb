require "pry"

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
    self
  end

  def self.create
    new.save
  end

  def self.new_by_name(name)
    song = new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = create
    song.name = name
    song
  end

  def self.find_by_name(name)
    all.find { |song| song.name == name }
  end

  def self.find_or_create_by_name(name)
    find_by_name(name) || create_by_name(name)
  end

  def self.alphabetical
    all.sort_by(&:name)
  end

  def self.new_from_filename(file)
    file_array = file.split(" - ")
    file_array[1].delete_suffix!(".mp3")

    song = new
    song.artist_name = file_array[0]
    song.name = file_array[1]
    song
  end

  def self.create_from_filename(file)
    new_from_filename(file).save
  end

  def self.destroy_all
    @@all = []
  end
end
