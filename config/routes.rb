Rails.application.routes.draw do
  get 'todolists/new'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get 'top' => 'homes#top'
  post 'todolists' => 'todolists#create'
end
