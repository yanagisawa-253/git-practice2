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
    root to: 'homes#top'
    resources :items
    resources :genres, only:[:index, :create, :edit, :update]
    resources :customers, only:[:show, :index, :edit, :update]
    resources :orders, only:[:index, :show, :update]
    resources :order_items, only:[:update]
    end
  
  namespace :public do
    # get 'orders/comfirm' => 'orders#comfirm'
    post 'orders/comfirm' => 'orders#comfirm', as: "orders_comfirm"
    get 'orders/thanks' => 'orders#thanks'
    resources :customers, only:[:show, :edit, :update] do
      get '/unsubscribe' => 'customers#unsubscribe'
      patch '/withdraw' => 'customers#withdraw', as: 'withdraw_customer'
    end
    resources :orders, only:[:new, :create, :index, :show] 
    resources :addresses, only:[:index, :create, :edit, :update, :destroy]
    resources :items, only:[:show, :index]
    resources :cart_items, only:[:index, :update, :destroy, :create] do
      collection do
        delete 'destroy_all'
      end
    end
  end
end
