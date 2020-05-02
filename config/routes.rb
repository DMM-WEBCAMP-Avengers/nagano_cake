Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    passwords: 'users/passwords'
  }
  devise_for :admin_users, controllers: {
    sessions: 'admin_users/sessions',
    registrations: 'admin_users/registrations',
    passwords: 'admin_users/passwords'
  }

  root 'public/users#top'
  put '/user' => 'public/users#destroy'
  scope module: :public do
    resource :user, only: [:edit, :show, :update] do
      collection do
        get 'cancel'
      end
    end

    resources :products, only: [:index, :show]

    resources :cart_products, only: [:create, :index, :update, :destroy] do
      collection do
        delete 'destroy_all'
      end
    end

    resources :orders, only: [:new, :create, :index, :show] do
      collection do
        get 'confirmation'
        get 'finish'
      end
    end

    resources :destinations, only: [:index, :create, :edit, :update, :destroy]
  end


  get '/admin', to: 'admin/users#top'
  namespace :admin do
    resources :users, only: [:index, :edit, :show, :update]

    resources :products, only: [:new, :index, :create, :edit, :show, :update]

    resources :genres, only: [:index, :create, :edit, :update]

    resources :orders, only: [:index]
  end
  get '/admin/orders/:order_history_id', to: 'admin/orders#show'
  patch '/admin/orders/:order_history_id/order_update', to: 'admin/orders#order_update'
  patch '/admin/orders/:ordered_product_id', to: 'admin/orders#work_update'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
