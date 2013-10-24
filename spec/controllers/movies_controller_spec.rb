require 'spec_helper'

describe MoviesController do
  describe 'TMDb search' do

    describe 'after incorrect search' do
      after :each do
        response.should redirect_to movies_path
      end
      it 'should return to movies_path when search box is empty' do
        post :search_tmdb, { :search_terms => '' }
      end
      it 'when bad search characters entered returns to movies_path' do
        post :search_tmdb, { :search_terms => '#$%^&' }
      end
    end
    before :each do
      @fake_results = [mock('movie1'), mock('movie2')]
    end
    it 'should call tmdb search method, search_tmdb' do
      Movie.should_receive(:find_in_tmdb).with('hardware').and_return(@fake_results)
      post :search_tmdb, {:search_terms => 'hardware' }
    end
    describe 'following correct search' do
      before :each do
        Movie.stub(:find_in_tmdb).and_return(@fake_results)
        post :search_tmdb, { :search_terms => 'hardware' }
      end
      it 'should use results from search for selection' do
        response.should render_template('search_tmdb')
      end
      it 'should make search results send to template' do
        assigns(:movies).should == @fake_results
      end
    end
  end
end
