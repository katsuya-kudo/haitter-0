Rails.application.routes.draw do
  get 'users/index' => 'users#index'
  get 'users/new' => 'users#new'
  get 'users/edit' => 'users#edit'
  get 'users/question' => 'users#question'
  get 'users/delete' => 'users#delete'
  get 'users/login_form' => 'users#login_form'
  
  get 'posts/index' => 'posts#index'
  get 'posts/new' => 'posts#new'
  post 'posts/create' => 'posts#create'
  get 'posts/:id'=> 'posts#show'
  get 'posts/:id/edit' => 'posts#edit'
  post 'posts/:id/update' => 'posts#update'
  post 'posts/:id/destroy' => 'posts#destroy'
  get 'posts/api' => 'posts#api'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/' => 'home#top'
  get 'about' => 'home#about'
  
end
