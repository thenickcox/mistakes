Mistakes::Application.routes.draw do

  root :to => 'posts#index'
  devise_for :users
  resources :users

  get 'tags/:tag', to: 'posts#index', as: :tag
  resources :posts

  devise_for :users, :path => '', :path_names => {:sign_in => 'login', :sign_out => 'logout'}

end
