Rails.application.routes.draw do
  root to: 'public/homes#top'

  # 顧客用
# URL /users/sign_in ...
devise_for :users,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

# 管理者用
# URL /admin/sign_in ...
devise_for :admin, skip: [:registrations, :passwords], controllers: {
  sessions: "admin/sessions"
}

scope module: :public do
  get '/top' => 'homes#top', as:'top'
  #ゲストログイン用
  post '/homes/guest_sign_in', to: 'homes#guest_sign_in'
  #users
  get '/users/my_page' => 'users#show'
  get '/users/like' => 'users#like'
  get '/users/post' => 'users#post'
  get '/users/information/edit' => 'users#edit'
  patch '/users/information' => 'users#update'
  get '/users/confirmation' => 'users#confirmation'
  patch '/users/withdrawal' => 'users#withdrawal'
  #recipe_d
  resources :recipe_ds do
    resources :comments, only: [:create, :destroy]
    resource :likes, only: [:create, :destroy]
  end
  resources :evaluations, only: [:create, :update, :destroy]
  resources :materials, only: [:create, :update, :destroy]
  resources :procedures, only: [:create, :update, :destroy]
end

namespace :admin do
    root to: 'homes#top'
    get '/top' => 'homes#top', as:'top'
    resources :users, only: [:index, :show, :edit, :update]
    #recipe_d
    resources :recipe_ds, only: [:index, :show, :edit, :update, :destroy] do
      resources :comments, only: [:destroy]
    end
    resources :materials, only: [:create, :update, :destroy]
    resources :procedures, only: [:create, :update, :destroy]
  end
end
