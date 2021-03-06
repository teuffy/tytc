Tytc::Application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  resources :links
  resources :comments
  resources :votes
  resources :taggings
  resources :tags

  match "/save" => "users#update"
  match "/:username" => "users#show"

  root :to => "links#index"
end