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

    resources :users, only: [:index, :show, :edit, :update]

  end

  scope module: :public do

    resources :items, only: [:index, :show]

    root to: 'homes#top'
    get 'about' => 'homes#about', as:'about'

    resources :users, only: [:show, :edit, :update]
    get 'users/confirmation', to: 'customers#confirmation'
    patch 'withdrawal' => 'users#withdrawal'

    resource :reviews, only: [:index, :new, :create]

  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
