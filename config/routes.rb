Rails.application.routes.draw do

 # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to:'homes#top'
  get '/home/about' => 'homes#about'

  get '/search' => 'search#search'

  scope module: 'public' do

    #onlyでアクションを指定してやらないとユーザー登録・ログイン時にcustomersコントローラーが呼び出されてしまう
    resource :customers, only: [:edit, :update] do
      get 'my_page' => 'customers#show'
      get 'confirm'
      patch 'withdrawal'
    end

    #下記の文が上記のresource :customers doよりも上にあるとcustomersコントローラーがうまく呼び出されない
    #下記のコードがユーザー登録・ログインで使いたいコントローラー
    devise_for :customers, only: [:sessions, :registrations]

    resources :addresses

    post "orders/thanks" => "orders#thanks"
    get "orders/complete" => "orders#complete"
    resources :orders, only:[:new, :create, :index, :show]
    resources :cart_items, only:[:index, :update, :create, :destroy]
    delete "cart_items" => "cart_items#destroy_all"
    resources :items, only:[:index, :show]
  end

  devise_for :admins, only: [:sessions], :controllers => {
    :sessions => 'admin/sessions'
  }

  namespace :admin do
    resources :customers
    resources :items
    resources :genres, only:[:index, :update, :create, :edit]
    resources :orders, only:[:index, :show, :update]
    resources :order_details, only:[:update]
    get "orders/current_user_order/:id" => "orders#current_user_order"
  end
end
