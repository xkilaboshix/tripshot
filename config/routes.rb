Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'homes#top'
  resources :users, only: [:show, :edit, :update]
  get '/users/:id/withdraw' => 'users#withdraw', as: 'withdraw_user' #退会画面への遷移
  patch '/users/:id/withdraw' => 'users#switch', as: 'withdraw_switch_user' #会員ステータスの切替
  
  resources :posts do
    resources :favorites, only: [:create, :destroy]
    resources :post_comments, only: [:create, :destroy]
  end
  resources :favorites, only: [:index]
  
  resources :lists, except: [:index]

  
  resources :rooms, except: [:new, :edit, :update]
  resources :user_rooms, only: [:create]
  resources :relationships, only: [:index, :create, :destroy]

end
