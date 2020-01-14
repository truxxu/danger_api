Rails.application.routes.draw do
  resources :topics, only: [:show, :index] do
    resources :discussions, only: [:index, :new, :create, :show] do
      resources :posts, only: [:index, :new, :create]
    end
  end
end
