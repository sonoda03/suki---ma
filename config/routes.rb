Rails.application.routes.draw do
  
  root :to =>"public/homes#top"
  
  # 顧客用
  # URL /customers/sign_in ...
  devise_for :customers,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }
  
  # 顧客用
  scope module: :public do
    
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
