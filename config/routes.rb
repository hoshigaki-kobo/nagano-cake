Rails.application.routes.draw do
   scope module: :public do
     get 'customers/edit' => 'customers#edit', as: 'customer_edit'
   end

  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }
  scope module: :public do
    #homesコントローラ
    root to: "homes#top", as: "root"
    get "about"=>"homes#about", as: "about"
    #costomersコントローラ
    get "customers/unsubscribe" => "customers#unsubscribe", as: "unsubscribe"
    patch "customers/withdraw" => "customers#withdraw", as: "withdraw"
    #上の2行は下のresourcesより上に記述する必要がある
    get 'customers/my_page' => 'customers#show'
    patch 'customers' => 'customers#update'
    #ordersコントローラ
    post "orders/comfirm" => "orders#confirm", as: "confirm"
    get "orders/complete" => "orders#complete", as: "complete"
    resources :orders, only: [:new,:create,:index,:show]
    #shippingsコントローラ
    resources :shippings, only: [:index,:create,:edit,:update,:destroy]
    #genresコントローラ
    resources :genres, only: [:show]
    #itemsコントローラ
    resources :items, only: [:index,:show]
    #cart_itemsコントローラ
    delete "cart_items/destroy_all" => "cart_items#destroy_all",as: "destroy_all"
    resources :cart_items, only: [:index,:create,:update,:destroy]
  end
  #管理者側
  namespace :admin do
    #homesコントローラ
    root to: "homes#top", as: "root"
    #itemsコントローラ
    resources :items, only: [:index,:show,:new,:create,:edit,:update]
    #genresコントローラ
    resources :genres, only: [:create,:index,:edit,:update]
    #customersコントローラ
    resources :customers, only: [:index,:show,:edit,:update]
    #ordersコントローラ
    resources :orders, only: [:show,:update] do
      resources :order_items, only: [:update]
    end
  end
    devise_for :customers,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }
end