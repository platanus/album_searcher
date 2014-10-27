Rails.application.routes.draw do
  get '/' => 'albums#index'
  get '/search' => 'albums#search', as: :album_search
end
