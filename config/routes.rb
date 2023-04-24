Rails.application.routes.draw do

  devise_for :customers, controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }

  root to: 'public/homes#top'

  namespace :admin do
    get 'homes/top' => 'homes#top'
    resources :orders, only: [:show, :update]
    get 'order_details/update'
    resources :customers, only: [:index, :show, :edit, :update]
    resources :genres, only: [:index, :create, :edit, :update]
    resources :items, only: [:index, :new, :create, :show, :edit, :update]
  end

  scope module: :public do
    get 'homes/top'
    get 'homes/about'
    get 'customers/unsubscribe'
    patch 'customers/withdraw'
    resources :customers, only: [:show, :edit, :update]
    resources :items, only: [:show, :index]
    resources :addresses, only: [:index, :edit, :create, :update, :destroy]
    resources :cart_items, only: [:index, :update, :destroy, :create] do
      collection do
        delete 'destroy_all'
      end
    end
    post 'orders/confirm'
    get 'orders/complete'
    resources :orders, only: [:new, :create, :index, :show]
  end

end
