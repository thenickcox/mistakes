Mistakes::Application.routes.draw do

  root :to => 'posts#index'
  devise_for :users
  resources :users

  get 'tags/:tag', to: 'posts#index', as: :tag
  resources :posts

  devise_for :users, :skip => [:sessions]
  as :user do
    get 'signin' => 'devise/sessions#new', :as => :new_user_session
    post 'signin' => 'devise/sessions#create', :as => :user_session
    delete 'signout' => 'devise/sessions#destroy', :as => :destroy_user_session
  end

end
