Rails.application.routes.draw do

  devise_for :customers,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }
  scope module: :public do
    #homesコントローラ
    root to: "homes#top", as: "root"
    get "about"=>"homes#about", as: "about"
    #costomersコントローラ
    resource :costomers, only: [:show,:edit,:update]
    get "customers/unsubscribe" => "public/costomers#unsubscribe", as: "unsubscribe"
    patch "customers/withdraw" => "public/costomers#withdraw", as: "withdraw"
    #ordersコントローラ
    resources :orders, only: [:new,:create,:index,:show]
    post "orders/comfirm" => "orders#confirm", as: "confirm"
    get "orders/complete" => "orders#complete", as: "complete"
    #shippingsコントローラ
    resources :shippings, only: [:index,:create,:edit,:update,:destroy]
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
    resources :costomers, only: [:index,:show,:edit,:update]
    #ordersコントローラ
    resources :orders, only: [:show,:update] do
      resources :order_items, only: [:update]
    end
  end
end