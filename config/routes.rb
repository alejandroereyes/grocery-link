Rails.application.routes.draw do

  namespace :api, defaults: { format: :json } do
    get 'lookup/retailers', to: '/api/lookup#retailers', as: 'retailers'
    get 'lookup/categories', to: '/api/lookup#categories', as: 'categories'
    get 'lookup/retailersinarea', to: '/api/lookup#retailers_in_area', as: 'area_reatailers'
    get 'products/byname', to: '/api/products#products_by_name', as: 'products_by_name'
    get 'products/byid', to: '/api/products#product_by_id', as: 'product_by_id'
  end

  devise_for :users



    resources :items
    post 'items/import', to: 'items#import', as: 'import_item'
    resources :users
    resources :retailers
    resources :stores
    get '/admin/dashboard', to: 'admin#dashboard', as: 'dashboard'
    get '/admin/high_list', to: 'admin#high_list', as: 'high_list'
    get '/admin/low_list', to: 'admin#low_list', as: 'low_list'

  get 'api/docs', to: 'api/welcome#docs', as: "docs"
  root to: 'api/welcome#home'
end
