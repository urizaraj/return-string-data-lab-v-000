Rails.application.routes.draw do
  get 'home', to: 'static#home'
  resources :orders
  resources :invoices

  resources :products do
    get 'description', on: :member
    get 'inventory', on: :member
  end
end
