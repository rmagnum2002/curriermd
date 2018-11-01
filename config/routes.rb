Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :articles
  resources :feedback
  # resources :authors
  mount Ckeditor::Engine => '/ckeditor'

  # get "welcome/contact"
  get 'welcome/index'
  get 'tags/:tag', to: 'articles#index', as: :tag
  get 'authors/:author', to: 'articles#index', as: :author
  get 'authors', to: 'authors#index'
  get 'tags', to: 'tags#index'
  get 'editions/:edition', to: 'articles#index', as: :edition
  get 'concours/:id', to: 'articles#show', as: :show_contest
  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  get 'contact', to: 'welcome#contact'
  get 'a_propos_de_nous', to: 'welcome#about', as: :about
  get 'participate', to: 'welcome#participate'
  get 'membres', to: 'welcome#membres'
  get 'set_locale', to: 'welcome#set_locale'
  get 'all_editions', to: 'welcome#all_editions'
  get 'articles_by_years', to: 'welcome#articles_by_years'

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  root to: 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
