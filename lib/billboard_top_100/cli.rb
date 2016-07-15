class BillboardTop100::CLI

  def call
    puts "Welcome to the Billboard Top 100 Songs! \n"
    start
  end

  def start
    puts "Please enter two numbers from 1-100 that will provide the corresponding top songs (e.g. 1, 15)"
    first = gets.strip.to_i - 1
    second = gets.strip.to_i - 1
    print_songs(first, second)

    puts "What song number would you like more information on?"
    input = gets.strip.to_i - 1
    print_song(input)

    puts "Would you like to see another song? Enter 'Y' or 'N'"
    input = gets.strip
    if input == "y"
      start
    else
      puts "Thank you! Keep on rockin'!"
      exit
    end
  end

  def print_songs(first, second)
    puts ""
    puts "---------- Songs #{first + 1} - #{second + 1} ----------"
    puts ""
    BillboardTop100::Song.all[first, second+1].each.with_index do |song, index|
    puts "#{index+1}. #{song[:title]} - #{song[:artist]}"
   end
  end

  def print_song(position)
    scraper = BillboardTop100::Scraper.new
    scraper.collect_songs
    songs = scraper.display_songs
    song = songs[position]
    puts ""
    puts "----------- #{song[:title]} - #{song[:artist]} -----------"
    puts ""
    puts "Chart Position:     #{song[:position]}"
    puts "Peak Position:      #{song[:peak]}"
    puts "Last Week:          #{song[:last_week_position]}"
    puts "Weeks On Chart:     #{song[:weeks_on_chart]}"
  end
end
