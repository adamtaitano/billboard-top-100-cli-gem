class BillboardTop100::Song

  attr_accessor :title, :artist, :position, :peak, :last_week_position, :weeks_on_chart

  def initialize(attributes)
    attributes.each {|key, value| self.send(("#{key}="), value)}
  end

  def self.all
    songs = BillboardTop100::Scraper.new
    songs.get_page
    songs.collect_songs
    @@all ||= songs.display_songs
  end

  def self.find(position)
    self.all
    @@all[position.to_i]
  end

  def self.find_by_name(title)
    self.all
    @@all.detect {|song| song[:title] == title }
  end

end
