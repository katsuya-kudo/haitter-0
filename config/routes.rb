Rails.application.routes.draw do
  post 'resignation' => 'resignation#resignation'
  get 'resignation' => 'resignation#resignation_form'
  post 'inquiry' => 'inquiry#inquiry'
  get 'inquiry' => 'inquiry#inquiry_form'
  post 'haittum/:post_id/create' => 'haittum#create'
  post 'haittum/:post_id/destroy' => 'haittum#destroy'
  
  post 'users/:id/update' => 'users#update'
  get 'users/:id/edit' => 'users#edit'
  post 'users/create' => 'users#create'
  get 'signup' => 'users#new'
  get 'users/index' => 'users#index'
  get 'users/:id' => 'users#show'
  get 'users/question' => 'users#question'
  get 'users/delete' => 'users#delete'
  post 'login' => 'users#login'
  get 'login' => 'users#login_form'
  post 'logout' => 'users#logout'
  
  get 'posts/index' => 'posts#index'
  get 'posts/new' => 'posts#new'
  post 'posts/create' => 'posts#create'
  get 'posts/:id' => 'posts#show'
  get 'posts/:id/edit' => 'posts#edit'
  post 'posts/:id/update' => 'posts#update'
  post 'posts/:id/destroy' => 'posts#destroy'
  get 'posts/api' => 'posts#api'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/' => 'home#top'
  get 'about' => 'home#about'
  
end
