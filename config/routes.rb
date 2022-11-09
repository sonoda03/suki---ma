Rails.application.routes.draw do
  root :to =>"public/homes#top"

  namespace :public do
  end

  # 顧客用
  devise_for :customers,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }
  devise_scope :customer do
    # ゲストログイン
    post 'customers/guest_sign_in' => 'public/sessions#guest_sign_in'
  end

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

  # 管理者用
  # URL /admin/sign_in
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }

  namespace :admin do
    resources :customers, only: [:index, :show, :edit, :update]
  end


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
