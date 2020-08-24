Rails.application.routes.draw do
  root to: 'home#index'

  scope '/:locale' do
    root to: 'home#index'

    get 'home/index'

    resources :sessions, only: [:new, :create, :destroy]

    resources :users, only: [:index, :new, :create, :edit, :update, :destroy] do
      resources :upvoted_futures, only: [:create, :destroy]
      resources :upvoted_outcomes, only: [:create, :destroy]
      resources :upvoted_comments, only: [:create, :destroy]
    end

    resources :futures do
      resources :comments, only: [:new, :create, :destroy]
      resources :outcomes, only: [:new, :create, :edit, :update, :destroy]
      resources :photos, only: [:index, :create]
      resources :personalized_photos, only: [:destroy]
    end

    get 'account', to: 'account#edit'
    patch 'account', to: 'account#update'
    get 'account/futures'

    get 'signup', to: 'users#new'
    get 'login', to: 'sessions#new'
    get 'logout', to: 'sessions#destroy'

    get 'about', to: 'home#about'
    get 'chronology', to: 'home#chronology'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  end
end
