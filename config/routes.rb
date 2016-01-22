Rails.application.routes.draw do
  get 'rottingzombies/index'

  # 原本
  # resources :zombies 
    resources :zombies do
      resources :tweets

      # 想要有zombie/5/decomp網址
      member do   
        get 'decomp'   
      end
      #等於get :decomp, on: :member
      #也等於match 'zombies/:id/decomp' => 'Zombies#decomp', :as => :decomp_zombie 但上面比較好
 
      # 客製化網址
      # 有兩種:單一資源用member，多個資源用collection
  
      # 要得到某一zombie的decomp狀態
      # get :decomp, on: :member      /zombies/:id/decomp   decomp_zombie_path(@zombie)
      # 要更新某一zombie的decomp狀態
      # put :decay, on: :member       /zombies/:id/decay    decay_zombie_path(@zombie)
  
      # 要得到年輕zombie的list
      # get :fresh, on: :collection   /zombies/fresh    fresh_zombies_path
      # 要對zombies做搜尋
      # post :search, on: :collection /zombies/search   search_zombies_path
      
      # Examples:
      # <%= link_to 'Fresh zombies', fresh_zombies_path %>
      # <%= form_tag(search_zombies_path) do |f| %> 搜尋的表單
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
