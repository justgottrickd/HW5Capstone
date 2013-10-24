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
  describe 'find keyword in the movie database.' do 
    before :each do
	test = Movie.new
	test.stub(:create_from_tmdb)
	@movie = [double('first'), double('second')]
	@movie.stub(:find_in_tmdb) {Array}
    end

    it 'array should return from movie model' do
	@movie.find_in_tmdb.should eq(Array)
    end
    it 'create from tmdb method should currently contain elements' do		
	Movie.should respond_to(:create_from_tmdb).with(1).argument
    end
  end
end
