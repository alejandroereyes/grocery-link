Rails.application.routes.draw do

  namespace :api, defaults: { format: :json } do
    get 'lookup/retailers', to: '/api/lookup#retailers', as: 'retailers'
    get 'lookup/categories', to: '/api/lookup#categories', as: 'categories'
    get 'lookup/retailersinarea', to: '/api/lookup#retailers_in_area', as: 'area_reatailers'
    get 'products/byname', to: '/api/products#products_by_name', as: 'products_by_name'
    get 'products/byid', to: '/api/products#product_by_id', as: 'product_by_id'
  end

  devise_for :users

  # authenticate :employee do

    resources :items
    post 'items/import', to: 'items#import', as: 'import_item'
    resources :users
    resources :retailers
    resources :stores
    get '/admin/dashboard', to: 'admin#dashboard', as: 'dashboard'
  # end

  get 'api/docs', to: 'api/welcome#docs', as: "docs"
  root to: 'api/welcome#home'
end
