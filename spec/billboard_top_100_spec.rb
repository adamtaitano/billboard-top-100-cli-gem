require 'spec_helper'
#
# describe BillboardTop100 do
#   it 'has a version number' do
#     expect(BillboardTop100::VERSION).not_to be nil
#   end
# end
#
# describe BillboardTop100::Song do
#   context 'Class Methods' do
#     describe '.all' do
#       it 'lists all the songs in the top 100' do
#         array = Array.new(100, "Song")
#         expect(BillboardTop100::Song.all).to eql(array)
#       end
#     end
#   end
#
#   context 'Instance Methods' do
#     describe '#title' do
#       song = BillboardTop100::Song.new("Sexyback")
#       it 'has a song title' do
#         expect(song.title).to eq("Sexyback")
#       end
#     end
#     describe '#artist' do
#       song = BillboardTop100::Song.new("Sexyback")
#       song.artist = "Justin Timberlake"
#       it 'has an artist' do
#         expect(song.artist).to eq("Justin Timberlake")
#       end
#     end
#     describe '#position' do
#       song = BillboardTop100::Song.new("Sexyback")
#       song.position = 1
#       it 'has a position' do
#       expect(song.position).to eq(1)
#       end
#     end
#     describe '#peak' do
#       song = BillboardTop100::Song.new("Sexyback")
#       song.peak = 1
#       it 'has a peak position' do
#       expect(song.peak).to eq(1)
#       end
#     end
#     describe '#last_week_position' do
#       song = BillboardTop100::Song.new("Sexyback")
#       song.last_week_position = 1
#       it 'has a peak position' do
#       expect(song.last_week_position).to eq(1)
#       end
#     end
#     describe '#weeks_on_chart' do
#       song = BillboardTop100::Song.new("Sexyback")
#       song.weeks_on_chart = 1
#       it 'has a peak position' do
#       expect(song.weeks_on_chart).to eq(1)
#       end
#     end
#   end
# end
#
# describe BillboardTop100::Scraper do
#
#   describe "#get_page" do
#     it 'gets the page' do
#       expect(BillboardTop100::Scraper.new.get_page).should_not be(nil)
#     end
#   end
#   describe '#collect_songs' do
#     it 'collects 100 songs' do
#       doc = BillboardTop100::Scraper.new
#       doc.collect_songs
#       expect(doc.display_songs.length).to eq(100)
#     end
#     it 'creates an array of hashes' do
#       doc = BillboardTop100::Scraper.new
#       doc.collect_songs
#       expect(doc.display_songs).to be_instance_of(Array)
#       expect(doc.display_songs[0]).to be_instance_of(Hash)
#     end
#     it 'includes attributes' do
#       doc = BillboardTop100::Scraper.new
#       doc.collect_songs
#       expect(doc.display_songs[0]).to have_key(:title)
#     end
#   end
#
# end

# describe BillboardTop100::CLI do
#
#   describe '#call' do
#     it 'calls upon #start' do
#       cli = BillboardTop100::CLI.new
#       expect(cli).to receive(:start)
#       cli.call
#     end
#     it 'should introduce' do
#     expect(STDOUT).to receive(:puts).with("Please enter the number of songs you would like to see (e.g. 15)")
#     require_relative './../lib/billboard_top_100/cli.rb'
#     cli = BillboardTop100::CLI.new
#     cli.start
#     end
#   end
#   describe '#start' do
#     it 'should ask for input' do
#       expect(STDOUT).to receive(:puts).with("Please enter the number of songs you would like to see (e.g. 15)")
#       require_relative './../lib/billboard_top_100/cli.rb'
#       cli = BillboardTop100::CLI.new
#       cli.start
#     end
#     # it 'should ask if user is done' do
#     #   expect(STDOUT).to receive(:puts).with("Would you like to see more songs? Enter 'Y' or 'N'")
#     #   require_relative './../lib/billboard_top_100/cli.rb'
#     #   cli = BillboardTop100::CLI.new
#     #   cli.start
#     # end
#   end
#   describe '#print_songs' do
#     cli = BillboardTop100::CLI.new
#     it 'should print formatted songs' do
#       expect(cli.print_songs).to include("1. One Dance - Drake Featuring WizKid & Kyla")
#     end
#     it 'should accept an argument of number(s) integer' do
#       expect { cli.print_songs(1) }.to_not raise_error
#     end
#   end
#   describe '#print_song' do
#     cli = BillboardTop100::CLI.new
#     it 'should accept a specific chart number' do
#       expect { cli.print_song(1) }.to_not raise_erro
#     end
#     it 'should print details about the song' do
#       expect(cli.print_songs).to include("Last Week's Position = 1")
#     end
#   end
# end

describe BillboardTop100::Song do
  context 'Class Methods' do
    describe ".all" do
      it 'returns an array' do
        expect(BillboardTop100::Song.all).to be_instance_of(Array)
      end
      it 'contains 100 songs' do
        expect(BillboardTop100::Song.all.length).to eql(100)
      end
      it 'calls upon Scraper' do
        expect(BillboardTop100::Song.all).to receive(BillboardTop100::Scraper)
      end
    end
    describe ".find" do
      it 'accepts a song position as an argument' do
        expect { BillboardTop100::Song.find("1") }.to_not raise_error
      end
      it 'returns a hash' do
        expect(BillboardTop100::Song.find(1)).to be_instance_of(Hash)
      end
    end
    describe ".find_by_name" do
      it 'accepts a string as an argument' do
        expect { BillboardTop100::Song.find_by_name("One Dance") }.to_not raise_error
      end
      it 'returns the appropriate song' do
        expect{ BillboardTop100::Song.find_by_name("One Dance") }.to eq({:title => "One Dance", :artist => "Drake Featuring WizKid & Kyla", :position => "1", :peak => "1", :last_week_position => "1", :weeks_on_chart => "14"})
      end
    end
  end
  context 'Instance Methods' do
    describe 'initialize' do
      attributes = {:title => "One Dance", :artist => "Drake Featuring WizKid & Kyla", :position => "1", :peak => "1", :last_week_position => "1", :weeks_on_chart => "14"}
      it 'accepts attributes' do
        expect(BillboardTop100::Song.new(attributes)).to_not raise_error
      end
      it 'calls upon #send' do
        expect(BillboardTop100::Song.new(attributes)).to receive(:send)
      end
    end
  end
end
