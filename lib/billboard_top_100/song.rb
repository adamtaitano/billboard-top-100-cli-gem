class BillboardTop100::Song

  @@all = []
  attr_accessor :title, :artist, :position, :peak, :last_week_position, :weeks_on_chart

  def initialize(title)
    @title = title
  end

  def self.all
    100.times do
      @@all << "Song"
    end
    @@all
  end

end
