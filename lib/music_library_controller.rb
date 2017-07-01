require 'pry'

class MusicLibraryController

  def initialize(path = "./db/mp3s")
    MusicImporter.new(path).import
  end

  def call
     puts "Welcome to your music library!"
     puts "To list all of your songs, enter 'list songs'."
     puts "To list all of the artists in your library, enter 'list artists'."
     puts "To list all of the genres in your library, enter 'list genres'."
     puts "To list all of the songs by a particular artist, enter 'list artist'."
     puts "To list all of the songs of a particular genre, enter 'list genre'."
     puts "To play a song, enter 'play song'."
     puts "To quit, type 'exit'."
     puts "What would you like to do?"
     input = gets.strip

      if input != "exit"
        call
      elsif input == "list songs"
        list_songs
      elsif input == "list artists"
        list_artists
      elsif input == "list genres"
        list_genres
      elsif input == "list artist"
        list_songs_by_artist
      elsif input == "list genre"
        list_songs_by_genre
      elsif input == "play song"
        play_song
      end
   end

   def list_songs
     Song.all.sort_by!{ |song| song.name.downcase }
     Song.all.each_with_index do |song, i|
       puts "#{i+1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
     end
   end

   def list_artists
     Artist.all.sort_by!{ |artist| artist.name.downcase }
     Artist.all.each_with_index do |artist, i|
       puts "#{i+1}. #{artist.name}"
     end
   end

  # def list_genres
  #   Genre.all.sort!{ |genre1, genre2| genre1.name.downcase <=> genre2.name.downcase }
  #   Genre.all.each_with_index do |genre, i|
  #     puts "#{i+1}. #{genre.name}"
  #   end
   #end

   def list_genres
     Genre.all.sort{ |genre1, genre2| genre1.name <=> genre2.name }.each.with_index(1) do |genre, i|
       puts "#{i}. #{genre.name}"
     end
   end

   def list_songs_by_artist #in progress
     puts "Please enter the name of an artist:"
     input = gets.chomp
   end



end
