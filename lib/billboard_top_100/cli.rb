class BillboardTop100::CLI

  def call
    puts "Welcome to the Billboard Top 100 Songs! \n"
    start
  end

  def start
    puts "Please enter two numbers from 1-100 that will provide the corresponding top songs (e.g. 1, 15)"
    first = gets.strip.to_i
    second = gets.strip.to_i
    print_songs(first, second)

    puts "What song would you like more information on?"
    input = gets.strip.to_i
    print_song(song)

    puts "Would you like to see another song? Enter 'Y' or 'N'"
    if input == "y"
      start
    else
      puts "Thank you! Keep on rockin'!"
      exit
    end
  end

  def print_songs(first, second)
    puts ""
    puts "---------- Songs #{first} - #{second} ----------"
    puts ""
    BillboardTop100::Song.all[first, second].each.with_index do |song, index|
     puts "#{index}. #{song.title} - #{song.artist}"
   end
  end

  def print_song(song)
    puts ""
    puts "----------- #{song.title} - #{song.artist} -----------"
    puts ""
    puts "Chart Position:     #{song.position}"
    puts "Peak Position:      #{song.peak}"
    puts "Last Week:          #{song.last_week_position}"
    puts "Weeks On Chart:     #{song.weeks_on_chart}"
  end
end
