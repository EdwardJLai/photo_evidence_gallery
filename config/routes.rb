PhotoApp::Application.routes.draw do
  devise_for :users
  resources :users, :only => [:index, :edit, :destroy, :update]
  get 'photos/multiple_uploads' => 'photos#multiple_uploads'
  post 'photos/multiple_uploads' => 'photos#make_multiple'
  get 'photos/edit_queue' => 'photos#edit_queue', as: 'edit_queue'
  get 'photos/index' => 'photos#index', :defaults => {:edited => 'true', :incident => 'All'}
  get '/' => 'photos#index', :defaults => {:edited => 'true', :incident => 'All'}
	get 'photos/flickr/:id' => 'photos#flickr_auth', as: 'flickr_auth'
  get '/auth/facebook/callback/' => 'photos#facebook_upload'
	post 'photos/flickr/:id' => 'photos#flickr_upload', as: 'flickr_upload'
  post '/facebook/:id' => 'photos#facebook_auth'
  resources :photos
  # resources :csv
  post 'csv/import'
  get 'csv/export'
  get 'csv/index'

  get 'photos/code_image/:id' => 'photos#code_image'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  root 'photos#index'
  
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

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
