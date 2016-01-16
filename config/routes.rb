Rails.application.routes.draw do
  get 'rottingzombies/index'

  # 原本
  # resources :zombies 
    resources :zombies do
      resources :tweets
    end

    
    
  # <%= link_to "#{@zombie.name}’s Tweets", zombie_tweet_path(@zombie) %>
  # <%= link_to 'New Tweet', new_zombie_tweet_path(@zombie) %>
  # <%= link_to 'Edit', edit_zombie_tweet_path(@zombie, tweet) %>
  # <%= link_to 'Show', zombie_tweet_path(@zombie, tweet) %>
  # <%= link_to 'Show', [@zombie, tweet] %>
  # <%= link_to 'Destroy', [@zombie, tweet], method: :delete %>
    
  # <%= link_to 'All Zombies', zombies_path %>
  # <%= link_to 'New Zombie',  new_zombie_path %>
  # <%= link_to 'Edit Zombie', edit_zombie_path(@zombie) %>
  # <%= link_to 'Show Zombie', zombie_path(@zombie) %>
  # <%= link_to 'Show Zombie', @zombie %>
  # <%= link_to 'Destroy', @zombie, method: :delete %>



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
