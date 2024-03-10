Rails.application.routes.draw do
  devise_for :users

  root to: "items#index"
  resources :items, only: [:destroy, :new, :create, :show, :edit, :update] do
  end
  #get 'items/index'
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
   #root "articles#index"
 
end
