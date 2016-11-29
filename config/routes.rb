Rails.application.routes.draw do

  devise_for :admins, :controllers => { 
      :sessions => "admins/sessions", 
      :registrations => "admins/registrations", 
      :passwords => "admins/passwords", 
      :confirmations => "admins/confirmations"
    }

  devise_for :users, :controllers => { 
      :sessions => "users/sessions", 
      :registrations => "users/registrations", 
      :passwords => "users/passwords", 
      :confirmations => "users/confirmations"
    }
    
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  devise_scope :user do
    root to: 'users/sessions#new'
    get 'users/sign_in', to: 'users/sessions#new' , :path => "user/login"
    delete 'users/sign_out', to: 'users/sessions#destroy' , :path => "user/logout" 
  end
  
  get 'users/:id' => 'users#show', as: :users

  devise_scope :admin do
    get 'admins/sign_in', to: 'admins/sessions#new' , :path => "admin/login"
    get 'admins/sign_up', to: 'admins/registrations#new' , :path => "admin/sign_up"
    delete 'admins/sign_out', to: 'admins/sessions#destroy' , :path => "admin/logout"
  end

  namespace :admin do
    resources :users
    get 'home' => 'dashboard#home'
    #get 'home/:id' => 'users#show'
    get 'tables' => 'dashboard#tables'
  end


   get '/admins/' => 'admins#index',:as => 'admins'
   post '/admin' => 'admins#create'
   get '/admin/new' => 'admins#new', :as => 'new_admin'
   get '/admin/:id/edit' => 'admins#edit', :as => 'edit_admin'
   patch '/admin/:id' => 'admins#update', :as => 'update_admin'
   get '/admin/:id' => 'admins#show', :as => 'show_admin'
   
   delete 'admin/:id' => 'admins#destroy', :as => 'destroy_admin'


  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

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
