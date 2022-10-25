Rails.application.routes.draw do

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
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}
  root to: "homes#top"
  get 'homes/top'
  get 'home/about' => 'homes#about'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :adomin do
    resources :customers
    resources :items
    resources :genres, only:[:index, :update, :create, :edit]
    resources :orders, only:[:index, :show, :update]
    resources :order_details, only:[:update]

    get 'homes/top'=> 'homes#admin'
  end
end
