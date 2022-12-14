Rails.application.routes.draw do

  root :to =>"public/homes#top"

  namespace :public do
  end

  # 会員用
  # URL /users/sign_in ...
  devise_for :users,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: "public/sessions"
  }
  devise_scope :user do
    # ゲストログイン
    post "users/guest_sign_in" => "public/sessions#guest_sign_in"
  end

  # 会員用
  scope module: :public do
    resources :users, only: [:show, :edit, :update, :destroy] do
      get "/unsubscribe" => "users#unsubscribe"
      member do
        get "favorites"
      end
    end
    resources :posts do
      resources :post_comments, only: [:create, :destroy]
      resource :favorites, only: [:create, :destroy]
      collection do
        # 投稿詳細検索
        get "search"
        # 投稿タグ検索
        get "search_tag"
      end
    end
  end

  # 管理者用
  # URL /admin/sign_in
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }

  namespace :admin do
    resources :genres, only: [:index, :create, :edit, :update]
    resources :users, only: [:index, :show, :edit, :update, :destroy]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
