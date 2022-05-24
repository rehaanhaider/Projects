Rails.application.routes.draw do
  scope "(:locale)", locale: /#{I18n.available_locales.join("|")}/ do


    get 'expand', to: 'articles#expand'
    resources :articles do
      resources :comments
    end

    resources :users
    get    '/login',   to: 'sessions#new'
    post   '/login',   to: 'sessions#create'
    delete '/logout',  to: 'sessions#destroy'
    get '/search', to: 'search#index'

    get 'timeline', to: 'timeline#populate'

    get 'following', to: 'follow#following'
    get '/followings', to: 'follow#followings'

    get 'follow', to: 'follow#create'
    get 'followers', to: 'follow#show'

    get '/follower', to: 'follow#follower'

    get 'feeds', to: 'timeline#feeds'

    root 'welcome#index'
  end
end
