Rails.application.routes.draw do
  root 'top#index'

  resources :operations, shallow: true do
    get :search, on: :collection
    get :enable, on: :member

    resources :automations
  end
  resources :scenarios
  resources :tags, only: :index

  namespace :ajax do
    resources :operations, only: :index
    resources :services do
      post :exec, on: :collection
    end
  end

  resources :operation_properties

  namespace :my do
    resource :users, only: %i(edit update)
  end

  post "oauth/callback" => "oauths#callback"
  get "oauth/callback" => "oauths#callback" # for use with Github, Facebook
  get "oauth/:provider" => "oauths#oauth", :as => :auth_at_provider
end
