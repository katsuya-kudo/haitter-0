Rails.application.routes.draw do
  post 'resignations/create' => 'resignations#create'
  get 'resi' => 'resignations#new', as: 'resi'
  post 'inquiries/create' => 'inquiries#create'
  get 'inqu' => 'inquiries#new', as: 'inqu'
  post 'haittaes/:post_id/create' => 'haittaes#create'
  post 'haittaes/:post_id/destroy' => 'haittaes#destroy'
  
  post 'users/:id/update' => 'users#update'
  get 'users/:id/edit' => 'users#edit'
  post 'users/create' => 'users#create'
  get 'signup' => 'users#new'
  get 'users/all/index' => 'users#index'
  get 'users/:id' => 'users#show'
  post 'login' => 'users#login'
  get 'login' => 'users#login_form'
  post 'logout' => 'users#logout'
  
  get 'posts/index' => 'posts#index'
  get 'posts/api' => 'posts#api'
  get 'posts/new' => 'posts#new'
  post 'posts/create' => 'posts#create'
  get 'posts/:id' => 'posts#show'
  get 'posts/:id/edit' => 'posts#edit'
  post 'posts/:id/update' => 'posts#update'
  post 'posts/:id/destroy' => 'posts#destroy'
 
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/' => 'home#top'
  get 'about' => 'home#about'
  
end
