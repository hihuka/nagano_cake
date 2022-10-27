Rails.application.routes.draw do

  namespace :public do
    get 'orders/new'
    get 'orders/confirm'
    get 'orders/complete'
    get 'orders/index'
    get 'orders/show'
  end
  namespace :public do
    get 'cart_items/index'
  end
  namespace :public do
    get 'addresses/index'
    get 'addresses/edit'
  end
  namespace :public do
    get 'homes/top'
    get 'homes/about'
  end
  namespace :public do
    get 'items/index'
    get 'items/show'
  end
  devise_for :order_details
  devise_for :orders
  devise_for :genres
  devise_for :items
  devise_for :cart_items
  devise_for :addresses
  devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

 root to: "homes#top"
  get 'homes/top'
  get 'home/about' => 'homes#about'

  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :admin do
    resources :customers
    resources :items
    resources :genres, only:[:index, :update, :create, :edit]
    resources :orders, only:[:index, :show, :update]
    resources :order_details, only:[:update]

    get 'homes/top'=> 'homes#admin'
  end
end
