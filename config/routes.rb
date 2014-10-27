Rails.application.routes.draw do
  get '/' => 'albums#index'
  post '/search' => 'albums#search', as: :album_search
end
