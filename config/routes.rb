ActivityStreamMongoid::Application.routes.draw do

  authenticated :user do
    root :to => 'home#index'
  end
  root :to => "home#index"
  devise_for :users
  resources :users

  resources :communities do
    resources :articles
    resources :questions do
      resources :anwsers
    end
    get 'join', :on => :member  
  end
end