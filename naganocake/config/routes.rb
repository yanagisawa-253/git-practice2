Rails.application.routes.draw do

  devise_for :admins, controllers: {
  sessions:      'admins/sessions',
  passwords:     'admins/passwords',
  registrations: 'admins/registrations'
}
  devise_for :customers, controllers: {
  sessions:      'customers/sessions',
  passwords:     'customers/passwords',
  registrations: 'customers/registrations'
}
  root to: 'homes#top'
  get '/homes/about' => 'homes#about'
  
  namespace :admin do
    root to: 'admin/orders#index'
    get 'homes/top' => 'homes#top'
    resources :items
    resources :genres, only:[:index, :create, :edit, :update]
    resources :customers, only:[:show, :index, :edit, :update]
    resources :orders, only:[:show, :update]
    resources :order_items, only:[:update]
    end
  
  namespace :public do
    resources :customers, only:[:show, :edit, :update, :unsubscribe, :withdraw]
    resources :orders, only:[:new, :comfirm, :thanks, :create, :index, :show]
    resources :addresses, only:[:index, :create, :edit, :update, :destroy]
    resources :items, only:[:show, :index] do
      resources :cart_items, only:[:index, :update, :destroy, :destroy_all, :create]
    end
  end
end
