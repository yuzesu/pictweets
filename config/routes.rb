Rails.application.routes.draw do
  devise_for :users
  root 'tweets#index'
  resources :tweets do
    resources :comments, only: [:create]
  end
   #tweets_controllerに対してのresourcesメソッド
    resources :users, only: [:show] #users_controllerに対してのresourcesメソッド
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # get 'tweets' =>'tweets#index'#ツイート一覧画面
  # get 'tweets/new'=>'tweets#new'#ツイート投稿画面
  # post 'tweets' =>'tweets#create'#ツイート投稿
  # get 'users/:id' => 'users#show'
  # delete 'tweets/:id' => 'tweets#destroy'
  # get 'tweets/:id/edit'=> 'tweets#edit'
  # patch   'tweets/:id'  => 'tweets#update'
  # get 'tweets/:id'=> 'tweets#show' #ツイート詳細画面
end
