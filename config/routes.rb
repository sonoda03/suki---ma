Rails.application.routes.draw do

  root :to =>"public/homes#top"

  namespace :public do
  end

  # 会員用
  # URL /users/sign_in ...
  devise_for :users,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }
  devise_scope :user do
    # ゲストログイン
    post 'users/guest_sign_in' => 'public/sessions#guest_sign_in'
  end

  # 会員用
  scope module: :public do
    resources :users, only: [:show, :edit, :update] do
      get '/unsubscribe' => 'users#unsubscribe'
      patch '/withdraw' => 'users#withdraw'
    end
    resources :posts do
      resources :post_comments, only: [:create, :destroy]
      resource :favorites, only: [:create, :destroy]
    end
  end

  # 管理者用
  # URL /admin/sign_in
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }

  namespace :admin do
    # resources :users, only: [:index, :show, :edit, :update]
    resources :genres
    resources :users, only: [:index, :show, :edit, :update]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
