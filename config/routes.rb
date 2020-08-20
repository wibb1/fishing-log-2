Rails.application.routes.draw do
  root 'homes#index'
  devise_for :users

  get '/records/react', to: "records#index"
  get '/records/react/:id', to: "records#index"

  namespace :api do
    namespace :v1 do
      resources :records, only: [:index, :show] 
    end
  end
end
