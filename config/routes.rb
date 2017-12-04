Rails.application.routes.draw do
  resources :cardlibraries
  resources :libraries
  resources :cards
  resources :settings

  resources :people do
    resources :cards
  end

  devise_for :users
  root "home#index"

  get "tarot" => "tarot#index"
  get "about" => "home#about"
  get "meaning" => "meaning#index"
  get "1" => "tarot1#index"
  get "2" => "tarot2#index"
  get "3" => "tarot#index"
  get "4" => "tarot4#index"
  get "5" => "tarot5#index"
  get "6" => "tarot6#index"
  get "7" => "tarot7#index"
  get "8" => "tarot8#index"

  get "card" => "cards#index"
  get "card2" => "cards#special"

end
