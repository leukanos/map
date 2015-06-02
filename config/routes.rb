Rails.application.routes.draw do
  devise_for :users, :path_prefix => 'd'

  root 'work_times#index'
  
  resources :users
  resources :projects
  resources :work_times
end
