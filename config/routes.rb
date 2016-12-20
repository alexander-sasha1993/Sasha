Rails.application.routes.draw do
  get 'welcome/index'

  resources :orders
  resources :employees
  resources :positions
  resources :deliveries
  resources :clients
  resources :preparats
  resources :providers
  resources :types
  resources :manufacturers
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #Главная страница будет загружаться первой
  root 'welcome#index'
end
