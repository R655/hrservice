Hrservice::Application.routes.draw do



  get "salary/select_table"

  get "salary/table"
  
  devise_for :users

  # match "/departments_details/new/:department_id" => "departments_details#new", as: :new_in_department
  resources :employees_prev_positions do as_routes end
  resources :employees_positions do as_routes end
  resources :employees do as_routes end
  resources :dayoff_masks do as_routes end
  resources :positions do as_routes end
  resources :departments do
    as_routes 
    resources :positions do
      as_routes
      resources :employees_positions do
        as_routes
        resources :employees do
          as_routes
        end
      end
    end
    collection do
      get 'tree'  
    end
    member do
      get 'details'
    end 
  end  
  resources :sick_leaves do as_routes end
  resources :premia do as_routes end
  resources :accrual_types do as_routes end
  resources :aids do as_routes end
  resources :vacations do as_routes end
  resources :employees_visits do 
    as_routes
    collection do
      post 'submit_table' => 'employees_visits#submit_table', as: :submit_table
      get 'select_table' => 'employees_visits#select_table', as: :select_table
      get 'table' => 'employees_visits#table', as: :table
    end 
  end
  resources :holidays do as_routes end
  resources :users do as_routes end
  
  root :to => "departments#tree"
  

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

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



  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
  #
  # My examples:
  #
  # match 'fewfw' => 'departments#index', as: :program_link
  # match 'posts/:year(/:month)' => 'posts#index', :constraints => { :year => /\d{4}/ }, :as => :ants
end
