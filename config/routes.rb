Rottenpotatoes::Application.routes.draw do
  resources :movies
  # map '/' to be a redirect to '/movies'
  root :to => redirect('/movies')

		
  get '/movies/search_tmdb' # gets search input
  post '/movies/search_tmdb'  # results of search and how add selections
  post '/movies/add_tmdb' # adds selections from search_tmdb

end
