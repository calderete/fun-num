Rails.application.routes.draw do
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
root 'home#welcome', as: 'home'
get 'temp_conversion', to: 'temp_converter#temp_convert_selector', as: 'temp_convert'

post 'conversion/temp/f_to_c', to: 'temp_converter#f_to_c', as: 'f2c_convert'
post 'conversion/temp/to_k', to: 'temp_converter#to_k', as: 'to_k'
post 'conversion/temp/from_k', to: 'temp_converter#from_k', as: 'from_k'

get 'distance', to: 'distance_converter#distance_selector', as: 'distance_convert'
post 'conversion/distance/from_ly', to: 'distance_converter#from_lightyears', as: 'from_ly'
post 'conversion/distance/from_au', to: 'distance_converter#from_au', as: 'from_au'
post 'conversion/distance/from_parsec', to: 'distance_converter#from_parsec', as: 'from_parsec'

get  'test/number', to: 'number_test#test_selector', as: 'number_test'
post 'test/happy_number', to: 'number_test#happy_test', as: 'happy_test'

post 'test/levenshtein', to: 'levenshtein#compare', as: 'levenshtein_test'

get 'eve/pi', to: 'eve_pi#menu', as: 'eve_pi'
post 'eve/pi', to: 'eve_pi#data', as: 'pi_data'
  #   resources :products dos
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
