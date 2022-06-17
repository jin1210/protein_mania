Rails.application.routes.draw do

  devise_for :users,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

devise_for :admin, skip: [:registrations, :passwords], controllers: {
  sessions: "admin/sessions"
}


 namespace :admin do

    resources :items, except: [:destroy, :index]

    get '/' => 'homes#top'

    resources :users, only: [:index, :show, :edit, :update] do
      resources :reviews, only: [:index, :destroy]
    end



  end

  scope module: :public do

    resources :items, only: [:index, :show] do
      resources :reviews, only: [:index, :new, :create]
    end

    root to: 'homes#top'
    get 'about' => 'homes#about', as:'about'
    get 'search' => 'homes#search'

    resources :users, only: [:show, :edit, :update]
    get 'confirmation' => 'users#confirmation'
    patch 'withdrawal' => 'users#withdrawal'



  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
