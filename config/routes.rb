Rails.application.routes.draw do
  root to: 'pages#home'
  devise_for :users

  get '/records/react', to: "records#index"
  get '/records/react/:id', to: "records#index"

  resources :records, only: [:new, :create, :edit, :update]

  namespace :api do
    namespace :v1 do
      resources :records, only: [:index, :show] 
    end
  end

  resources :species, only: [:new, :create, :edit, :update, :index]
  
end
