Rails.application.routes.draw do

  namespace :public do
  end

  root :to =>"public/homes#top"

  # 顧客用
  # URL /customers/sign_in ...
  devise_for :customers,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  # ゲストログイン
    post 'customers/guest_sign_in' => 'public/sessions#guest_sign_in'

  # 顧客用
  scope module: :public do
    # 顧客側のマイページ,登録情報編集&更新
    get 'customers/my_page' => 'customers#show'
    get 'customers/information/edit' => 'customers#edit'
    patch 'customers/infomation' => 'customers#update'
    # 顧客側の退会確認画面,退会処理
    get '/customers/unsubscribe' => 'customers#unsubscribe'
    patch '/customers/withdraw' => 'customers#withdraw'
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
