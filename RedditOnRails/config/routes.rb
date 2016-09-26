Rails.application.routes.draw do

  resources :users
  resources :subs
  resources :subs, only: [:show] do
    resources :posts, only: [:new, :create, :destroy, :edit, :update]
  end
  resources :posts, only:[:show]
  resource :session
end
