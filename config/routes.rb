Rails.application.routes.draw do
  root to: 'pages#home'
  devise_for :users

  get '/records/react', to: "records#index"
  get '/records/react/create', to: "records#index" 
  get '/records/react/:id', to: "records#index"
  get '/records/react/:id/edit', to: "records#index"
  

  resources :records, only: [:new, :create, :edit, :update]
  resources :species, only: [:new, :create, :edit, :update, :index]

  namespace :api do
    namespace :v1 do
      resources :records, only: [:index, :show, :create, :update, :destroy]
      resources :species, only: [:create, :update, :index]
    end
  end

  
  
end
