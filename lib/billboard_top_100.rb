require 'open-uri'
require 'pry'
require 'nokogiri'

require_relative "./billboard_top_100/version"
require_relative "./billboard_top_100/cli"
require_relative "./billboard_top_100/song"
require_relative "./billboard_top_100/scraper"

module BillboardTop100
end

# puts "Creating Song"
# song = BillboardTop100::Song.new({:title => "One Dance", :artist => "Drake Featuring WizKid & Kyla", :position => "1", :peak => "1", :last_week_position => "1", :weeks_on_chart => "14"})
# puts "Displaying Song"
# song
# puts "Displaying Title"
# song.title
# puts "Displaying Artist"
# song.artist
# puts "Displaying Position"
# song.position
#
# puts "Scraping Songs"
# songs = BillboardTop100::Scraper.new
# puts "Collection Songs"
# songs.collect_songs
# puts "Displaying Songs"
# songs.display_songs

# puts "Creating CLI"
# cli = BillboardTop100::CLI.new
# cli.call
