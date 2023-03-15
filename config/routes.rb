Rails.application.routes.draw do
  
  devise_for :users,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}

  root to: 'homes#top'
    get '/' => 'homes#top'
    get '/about' => 'homes#about', as: 'about'

  namespace :public do
    resources :users,  only: [:show, :edit, :update] do
      get '/unsubscribe' => 'users#unsubscribe', as: 'unsubscribe'
      patch '/withdrawal' => 'users#withdrawal', as: 'withdrawal'
      resource :relationships, only: [:create, :destroy]
      get 'followings' => 'relationships#followings', as: 'followings'
      get 'followers' => 'relationships#followers', as: 'followers'
    end
  end
  
  resources :posts, only: [:new, :index,:show,:edit,:create,:destroy,:update] do
    resources :comments, only: [:create, :destroy]
    resource :favorites, only: [:create, :destroy]
    collection do
      get 'confirm'
    end
  end
  
  get 'searches/search' => "searches#search", as: 'search'
  resources :genres, only: [:index]
  
  namespace :admin do
    get '/top' => 'homes#top', as: 'top'
    resource :owners,  only: [:show, :edit, :update]
    resources :genres, except: [:new, :show]
    resources :users, only: [:index, :show, :edit, :update]
    patch "withdrawal/:id" => "users#withdrawal", as: "withdrawal"
  end
  
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
