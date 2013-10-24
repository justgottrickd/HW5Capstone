#PATRICK WALSH
class Movie < ActiveRecord::Base
  def self.all_ratings
    %w(G PG PG-13 R)
  end
 
  def self.create_from_tmdb(from_tm)
    from_tm.each_key do |curr_id|
      movie = Tmdb::Movie.detail(curr_id)
      Movie.create!(:title => movie.title, :rating => 'PG-13', :release_date => movie.release_date, :description => movie.overview)
    end
  end

  def self.find_in_tmdb(movie)
    fin = nil
  	Tmdb::Api.key('f4702b08c0ac6ea5b51425788bb26562')
    
  	fin = Tmdb::Movie.find(movie)
    list = Array.new
    if !fin.empty? || !fin.nil?
      fin.each do |movie|
        list.push({:tmdb_id => movie.id, :title => movie.title, :rating => 'PG-13', :release_date => movie.release_date})
      end
      
    end
    return list
  end


end
