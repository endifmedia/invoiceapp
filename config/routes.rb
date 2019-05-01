Rails.application.routes.draw do
	
  resources :invoice_items
  resources :clients
  resources :invoices
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'invoices#index'
end
