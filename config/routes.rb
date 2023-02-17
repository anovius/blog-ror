Rails.application.routes.draw do
  # devise_for :users
  namespace :api do
    namespace :v1 do
      resources :session, only: [:create, :destroy]

      namespace :user do
        post 'signup', to: 'user#signup'
      end
    end
  end
end
