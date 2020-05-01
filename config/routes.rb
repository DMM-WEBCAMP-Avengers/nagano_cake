Rails.application.routes.draw do
  get 'users/top'
  get 'users/index'
  get 'users/edit'
  get 'users/show'
  get 'users/top'
  get 'users/edit'
  get 'users/show'
  get 'users/cancel'
  devise_for :users
  devise_for :admin_users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
