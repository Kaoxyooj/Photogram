Rails.application.routes.draw do
  post ':user_name/follow_user', to: 'relationships#follow_user', as: :follow_user
  post ':user_name/unfollow_user', to: 'relationships#unfollow_user', as: :unfollow_user

  # get 'profiles/show'
  get ':user_name/following', to: "profiles#following", as: :following_user
  get ':user_name/posts', to: "profiles#posts", as: :posts_user
  get ':user_name/follower', to: "profiles#follower", as: :follower_user


  get 'notifications', to: 'notifications#index'
  get "notifications/:id/index", to: "notifications#index"
  get 'notifications/:id/link_through', to: 'notifications#link_through', as: :link_through
  get 'notifications/:id/mark_as_unread', to: 'notifications#mark_as_unread', as: :mark_as_unread
  get 'notifications/:id/mark_as_read', to: 'notifications#mark_as_read', as: :mark_as_read                                     

  root "posts#index"

  devise_for :users, :controllers => { registrations: "registrations" }
  devise_for :posts

  resources :users do
    member do
      get :following, :followers
    end
  end

  get "browse", to: "posts#browse", as: :browse_posts

  resources :posts do
    resources :comments
    member do
      get "like"
      get "unlike"
    end
  end

  get ":user_name", to: "profiles#show", as: :profile
  get ":user_name/edit", to: "profiles#edit", as: :edit_profile
  patch ':user_name/edit', to: 'profiles#update', as: :update_profile  

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

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
