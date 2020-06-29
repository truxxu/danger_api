Rails.application.routes.draw do
  # Follows good practice of shallow nesting
  # resources :topics, only: [:show, :index] do
  #   resources :discussions, only: [:index, :new, :create, :show, :destroy]
  # end
  # resources :discussions, only: [] do
  #   resources :posts, only: [:index, :new, :create]
  # end

  # Not recommended
  resources :topics, only: [:show, :index] do
    resources :discussions, only: [:index, :new, :create, :show] do
      resources :posts, only: [:index, :new, :create]
    end
  end
end
