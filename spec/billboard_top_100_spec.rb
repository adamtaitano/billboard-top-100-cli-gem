require 'spec_helper'

describe BillboardTop100 do
  it 'has a version number' do
    expect(BillboardTop100::VERSION).not_to be nil
  end
end

describe BillboardTop100::Song do
  context 'Class Methods' do
    describe '.all' do
      it 'lists all the songs in the top 100' do
        array = Array.new(100, "Song")
        expect(BillboardTop100::Song.all).to eql(array)
      end
    end
  end

  context 'Instance Methods' do
    describe '#title' do
      song = BillboardTop100::Song.new("Sexyback")
      it 'has a song title' do
        expect(song.title).to eq("Sexyback")
      end
    end
    describe '#artist' do
      song = BillboardTop100::Song.new("Sexyback")
      song.artist = "Justin Timberlake"
      it 'has an artist' do
        expect(song.artist).to eq("Justin Timberlake")
      end
    end
    describe '#position' do
      song = BillboardTop100::Song.new("Sexyback")
      song.position = 1
      it 'has a position' do
      expect(song.position).to eq(1)
      end
    end
    describe '#peak' do
      song = BillboardTop100::Song.new("Sexyback")
      song.peak = 1
      it 'has a peak position' do
      expect(song.peak).to eq(1)
      end
    end
    describe '#last_week_position' do
      song = BillboardTop100::Song.new("Sexyback")
      song.last_week_position = 1
      it 'has a peak position' do
      expect(song.last_week_position).to eq(1)
      end
    end
    describe '#weeks_on_chart' do
      song = BillboardTop100::Song.new("Sexyback")
      song.weeks_on_chart = 1
      it 'has a peak position' do
      expect(song.weeks_on_chart).to eq(1)
      end
    end
  end
end

describe BillboardTop100::Scraper do
  
  describe "#get_page" do
    it 'gets the page' do
      expect(BillboardTop100::Scraper.new.get_page).should_not be(nil)
    end
  end
  describe '#collect_songs' do
    it 'collects 100 songs' do
      doc = BillboardTop100::Scraper.new
      doc.collect_songs
      expect(doc.display_songs.length).to eq(100)
    end
    it 'creates an array of hashes' do
      doc = BillboardTop100::Scraper.new
      doc.collect_songs
      expect(doc.display_songs).to be_instance_of(Array)
      expect(doc.display_songs[0]).to be_instance_of(Hash)
    end
    it 'includes attributes' do
      doc = BillboardTop100::Scraper.new
      doc.collect_songs
      expect(doc.display_songs[0]).to have_key(:title)
    end
  end

end
