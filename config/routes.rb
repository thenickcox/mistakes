Mistakes::Application.routes.draw do

  root :to => 'posts#index'
  devise_for :users
  resources :users

  get 'tags/:tag', to: 'posts#index', as: :tag
  resources :posts

  devise_scope :user do
    root '/login' => 'devise/sessions#new'
    match '/logout' => 'devise/sessions#destroy'
  end

end
