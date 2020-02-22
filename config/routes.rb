Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'homes#top'
  resources :users, only: [:show, :edit, :update]
  get '/users/:id/withdrow' => 'users#withdrow', as: 'withdrow_user' #退会画面への遷移
  patch '/users/:id/withdrow' => 'users#switch', as: 'withdrow_switch_user' #会員ステータスの切替
  
  resources :lists, except: [:index]
  resources :posts
  resources :post_comments, only: [:create, :destroy]
  resources :favorites, only: [:index, :create, :destroy]
  resources :rooms, except: [:new, :edit, :update]
  resources :user_rooms, only: [:create]
  resources :relationships, only: [:index, :create, :destroy]

end
