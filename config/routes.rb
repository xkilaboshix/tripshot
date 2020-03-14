Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'homes#top'
  get '/users/:id/withdraw' => 'users#withdraw', as: 'withdraw_user' #退会画面への遷移
  get '/search', to: 'searchs#search', as: 'search' # 名前検索機能
  get '/search/list', to: 'searchs#search_list', as: 'search_list'
  get '/search/tag', to: 'searchs#search_tag', as: 'search_tag'
  patch '/users/:id/withdraw' => 'users#switch', as: 'withdraw_switch_user' #会員ステータスの切替
  
  resources :users, only: [:show, :edit, :update] do
    resources :favorites, only: [:index]
  end
  resources :posts do
    resources :favorites, only: [:create, :destroy]
    resources :post_comments, only: [:create, :destroy]
  end
  
  resources :lists, except: [:index]
  resources :rooms, except: [:new, :edit, :update]
  resources :user_rooms, only: [:create]
  resources :relationships, only: [:index, :create, :destroy]

end
