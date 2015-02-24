Rails.application.routes.draw do
  devise_for :users

  resources :users
  resources :admin
  resources :projects
  resources :work_times
end
