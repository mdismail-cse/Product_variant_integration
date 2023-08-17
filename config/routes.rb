Rails.application.routes.draw do
  resources :atr_values
  resources :variants
  resources :atributes
  resources :products
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
   root "products#index"
end
