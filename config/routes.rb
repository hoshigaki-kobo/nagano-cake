Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  ​
# 顧客用
# URL /customers/sign_in ...
devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}
​
# 管理者用
# URL /admin/sign_in ...
devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}
​
# ↑devise用の記述　カリキュラム丸コピ　いま全然意味分かってません＾＾；
​
  #homesコントローラ
  root to:"public/homes#top", as:"root"
  get "about"=>"public/homes#about", as:"about"
​
  #costomersコントローラ
  resource :costomers, only: [:show,:edit,:update]  #←個別のIDをURLに使わないので『resource(単数形)?』
  get "customers/unsubscribe" => "public/costomers#unsubscribe", as:"unsubscribe"
  patch "customers/withdraw" => "public/costomers#withdraw", as:"withdraw"
​
  #ordersコントローラ
  resources :orders, only: [:new,:create,:index,:show]
  post "orders/comfirm" => "public/orders#confirm", as:"confirm"
  get "orders/complete" => "public/orders#complete", as:"complete"
​
  #shippingsコントローラ
  resources :shippings, only: [:index,:create,:edit,:update,:destroy]
​
  #itemsコントローラ
  resources :items, only: [:index,:show]
​
  #cart_itemsコントローラ
  resources :cart_items, only: [:index,:create,:update,:destroy]
  delete "cart_items/destroy_all" => "public/cart_items#destroy_all"
​
​
  #管理者側
  namespace :admin do
​
    #homesコントローラ
    root to:"admin/homes#top", as:admin_root
​
    #itemsコントローラ
    resources :items, only: [:index,:show,:new,:create,:edit,:update]
​
    #genresコントローラ
    resources :genres, only: [:create,:index,:edit,:update]
​
    #customersコントローラ
    resources :costomers, only: [:index,:show,:edit,:update]
​
    #ordersコントローラ
    resources :orders, only: [:show,:update] do
      resources :order_items, only: [:update]
    end
​
​
  end

end
