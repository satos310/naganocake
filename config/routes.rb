Rails.application.routes.draw do
  devise_for :custemers
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :adomin do
    resources :items
  end
end
