Rails.application.routes.draw do
  get 'vm_details/add_quantity'
  post 'vm_details/add_quantity'
  get 'vm_details/list_products'
  post 'vm_details/list_products'


  get 'vm_details/subtract_quantity'

  get 'vendor/login'

  get 'vendor/signup'

  get 'vendor/add_product'

  get 'vendor/create'

  post 'vendor/login'

  post 'vendor/signup'

  post 'vendor/add_product'

  post 'vendor/create'

  post 'vendor/signup_check'

  post 'vendor/login_check'

  get 'order_items/send_data'
  post 'order_items/send_data'
  resources :products, only: [:index]
  resource :cart, only: [:show]
  resources :order_items, only: [:create, :update, :destroy, :send_data]
  root to: "products#index"
  controller :productdetails do
    get 'vendingmachine/:machineid' => 'productdetails#show'
  end
end
