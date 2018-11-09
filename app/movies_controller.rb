# Replace the '__' in the below methods to to make the specs pass!
# Each '__' corresponds to a single line of code you will need to write.
# See the example below on the left and how it should look on the right.
# def make_a_new_movie_instance    # def make_a_new_movie_instance
#   movie = __                     #   movie = Movie.new
# end                              # end

def can_be_instantiated_and_then_saved
  movie = Movie.new
  movie.title = "This is a title."
  movie.save
end

def can_be_created_with_a_hash_of_attributes
  # Initialize movie and then and save it

  attributes = {
      title: "The Sting",
      release_date: 1973,
      director: "George Roy Hill",
      lead: "Paul Newman",
      in_theaters: false
  }
  movie = Movie.new(attributes)
  movie.save
  movie
end

def can_be_created_in_a_block(hash = {title: "Home Alone", release_date: 1990})
  # # If no arguments are passed, use default values:
  # # title == "Home Alone"
  # # release_date == 1990
  # #default Values
  # attributes = {
  #     title: title,
  #     release_date: release_date,
  #     director: director,
  #     lead: lead,
  #     in_theaters: in_theaters
  # }
  #splat?!?!
  # binding.pry
  # movie = Movie.new
  # movie.title = title
  # movie.release_date = release_date
  # movie
movie = Movie.create {|m| m.title = hash[:title]; m.release_date = hash[:release_date]}
movie
end

def can_get_the_first_item_in_the_database
Movie.first
  # attributes = {
  #     title: "The Sting",
  #     release_date: 1973,
  #     director: "George Roy Hill",
  #     lead: "Paul Newman",
  #     in_theaters: false
  # }
  # movie = Movie.new(attributes)
  # movie.save
  # binding.pry
end

def can_get_the_last_item_in_the_database

Movie.last
end

def can_get_size_of_the_database
Movie.all.length

end

def can_find_the_first_item_from_the_database_using_id
  #binding.pry
  Movie.all[0]
  # Movie.all.each do |movie|
  #   if movie[:id] == 1
  #     movie
  #   end
  # end
end

def can_find_by_multiple_attributes
  # Search Values:
  # title == "Title"
  # release_date == 2000
  # director == "Me"
result = 0
  Movie.all.each do |movie|
    if movie.title == "Title" && movie.release_date == 2000 && movie.director == "Me"
      result =movie
    end
  end
  result
end

def can_find_using_where_clause_and_be_sorted
  # For this test return all movies released after 2002 and ordered by
  # release date descending
  Movie.all.select {|movie| movie.release_date > 2002}.sort_by {|movie| movie.release_date}.reverse
end

def can_be_found_updated_and_saved
  # Updtate the title "Awesome Flick" to "Even Awesomer Flick", save it, then return it

  Movie.create(title: "Awesome Flick")
  Movie.all.select {|movie| movie.title == "Awesome Flick"}.map {|movie| movie.update(title: "Even Awesomer Flick")}
  #Movie.find_by(title: "Awesome Flick").update(title: "Even Awesomer Flick")
end

def can_update_using_update_method
  # Update movie title to "Wat, huh?"
  Movie.create(title: "Wat?")
  Movie.find_by(title: "Wat?").update(title: "Wat, huh?")
end

def can_update_multiple_items_at_once
  # Change title of all movies to "A Movie"
  5.times do |i|
    Movie.create(title: "Movie_#{i}", release_date: 2000+i)
  end
  Movie.all.each do |movie|
    movie.update(title: "A Movie")
  end
end

def can_destroy_a_single_item
  Movie.create(title: "That One Where the Guy Kicks Another Guy Once")
  Movie.find_by(title: "That One Where the Guy Kicks Another Guy Once").delete
end

def can_destroy_all_items_at_once
  10.times do |i|
    Movie.create(title: "Movie_#{i}")
  end
  Movie.delete_all
end
