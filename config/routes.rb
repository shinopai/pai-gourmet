Rails.application.routes.draw do
  # devise
  devise_for :users, skip: 'sessions', controllers: {
        sessions: 'users/sessions',
        registrations: 'users/registrations'
      }
  devise_scope :user do
    get	'/users/sign_in', to: 'users/sessions#new', as: :new_user_session
    post	'/users/sign_in', to: 'users/sessions#create', as: :user_session
    get	'/users/sign_out', to: 'users/sessions#destroy', as: :destroy_user_session
  end

  # Defines the root path route ("/")
  root "home#index"

  # all restaurants list
  get '/all', to: 'restaurants#show_all', as: :all_restaurants

  # all restaurants list by area
  get '/all/area/:id', to: 'restaurants#show_all_by_area', as: :all_restaurants_area

  # all restaurants list by genre
  get '/all/genre/:id', to: 'restaurants#show_all_by_genre', as: :all_restaurants_genre

  # restaurant detail page
  get '/restaurant/:id', to: 'restaurants#show_detail', as: :show_restaurant

  # search restaurant
  get '/search', to: 'restaurants#search_restaurant', as: :search_restaurant

  # keep restaurant
  post '/users/:id/restaurants/:restaurant_id/keep', to: 'keeps#keep_restaurant', as: :keep_restaurant
end
