Rails.application.routes.draw do
  namespace :admin do
    resources :posts
    resources :users
    resources :admin_users

    root to: "posts#index"
  end

  resources :posts
  #don't allow users to sign up/register.
  devise_for :users, skip: [:registrations]
  root to: 'static#homepage'
end
