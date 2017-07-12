Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'
root 'bookstore#home'
  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products
get 'signup', to: 'users#new'
resources :users, except: [:new]
resources :categories, :books

#login page
get 'login', to: 'sessions#new'
post 'login', to: 'sessions#create'
delete 'logout', to: 'sessions#destroy'

#Wishlist
get 'wishlist/:id', to: 'wishlists#create', as: 'wishlist'
get 'wishlists', to: 'wishlists#show'
delete 'wishlist/:id', to: 'wishlists#destroy'

#Shoppingcart
get 'shoppingcart/:id', to: 'shoppingcarts#create', as: 'shoppingcart'
get 'shoppingcarts', to: 'shoppingcarts#show'
delete 'shoppingcart/:id', to: 'shoppingcarts#destroy'
#delete 'checkout', to: 'shoppingcarts#checkout'

#Checkout
get 'checkout', to: 'checkouts#create'
get 'checkout/shipping', to: 'shippingaddresses#shipping'
post 'checkout/shipping', to: 'shippingaddresses#create'
get 'checkout/billing', to: 'checkouts#billing'
get 'checkout/payment', to: 'checkouts#payment'
get 'checkout/summary', to: 'checkouts#summary'
get "checkout/buy", to: 'orders#buy'

#Buy history
get 'history', to: 'orders#show'

#tag
get 'tag/edit/:id', to: 'tags#show', as: 'tag/edit'
post 'tag/addtag/:id', to: 'tags#addtag', as: 'tag/addtag'
delete 'tag/delete/:id', to: 'tags#delete', as: 'tag/delete'

#bill
get 'receipts', to: 'receipts#index'


#sidekiq
require 'sidekiq/web'
mount Sidekiq::Web => '/sidekiq'
  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
