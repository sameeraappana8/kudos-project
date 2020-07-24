Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations' }
  resources :kudos, only: [:index, :show, :destroy]
  resources :users do
    get :profile
    resources :kudos, only: [:new, :create]
  end
  authenticated  :user do
    root "kudos#index", as: "authenticated_root"
  end
  root 'welcome#index'
end
