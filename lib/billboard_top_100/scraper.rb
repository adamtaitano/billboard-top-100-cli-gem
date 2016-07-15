class BillboardTop100::Scraper

  @@songs = []

  def get_page
    Nokogiri::HTML(open("http://www.billboard.com/charts/hot-100"))
  end

  def collect_songs
    document = Nokogiri::HTML(open("http://www.billboard.com/charts/hot-100"))
    @@songs = document.css("article.chart-row").collect do |song|
      title = song.css("h2.chart-row__song").text
      artist = song.css("a.chart-row__artist").text
      position = song.css("span.chart-row__current-week").text
      peak = song.css(".chart-row__top-spot .chart-row__value").text
      last_week_position = song.css(".chart-row__last-week .chart-row__value").text
      weeks_on_chart = song.css(".chart-row__weeks-on-chart .chart-row__value").text
      {:title => title, :artist => artist, :position => position, :peak => peak, :last_week_position => last_week_position, :weeks_on_chart => weeks_on_chart}
    end
  end

  def display_songs
    @@songs
  end

end
