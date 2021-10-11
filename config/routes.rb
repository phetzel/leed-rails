Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do 
    resources :employees, only: [:create, :index, :update, :destroy]
    resources :projects, only: [:create, :index, :update, :destroy]
    resource :session, only: [:create, :destroy, :show]
    resources :users, only: [:create, :show]
  end
end
