require 'spec_helper'

describe Movie do
  describe 'Check for valid  model methods' do 
     it 'There should be a find_in_tmdb method in movie model' do 
	Movie.should respond_to :find_in_tmdb
	end	
     it 'movie model should have create_fr' do 
	Movie.should respond_to :create_from_tmdb
	end
  end
  describe 'search keyword in tmdb' do
    it 'should access Tmdb by title keywords from api' do
      TmdbMovie.should_receive(:find).with(hash_including :title => 'Space Jam')
      Movie.find_in_tmdb('Inception')
    end
    it 'should create an InvalidKeyError when no api present' do
      Movie.stub(:api_key).and_return('')
      lambda { Movie.find_in_tmdb('Space Jam') }.should raise_error(Movie::InvalidKeyError)
    end
    it 'should create an InvalidKeyError when wrong API present' do
      TmdbMovie.stub(:find).and_raise(RuntimeError.new("API returned '404'"))
      Movie.stub(:api_key).and_return('INVALID')
      lambda { Movie.find_in_tmdb('Space Jam') }.should raise_error(Movie::InvalidKeyError)
    end
  end
end
