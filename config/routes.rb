Rails.application.routes.draw do

devise_for :users, :controllers => {:registrations => "users/registrations" }
    resources :events do
    collection do
      get :get_events
    end
    member do
      post :move
      post :resize
    end
  end
  

  get 'users/:id/shifts' => 'users#shifts', :as => :user_shifts
  resources :shifts
  resources :calendar
  resources :events

  get 'about'   => 'static_pages#about'
  get 'faq' => 'static_pages#faq'
  root 'welcome#index'
  resources :users
 




  resource :calendar, only: [:show], controller: :calendar
  
 

  resources :users, :controller => "users"
  get "mailbox/inbox" => "mailbox#inbox", as: :mailbox_inbox
  get "mailbox/sent" => "mailbox#sent", as: :mailbox_sent
  get "mailbox/trash" => "mailbox#trash", as: :mailbox_trash
  #root to: "calendar#show"

   # conversations
  resources :conversations do
    member do
      post :reply
      post :trash
      post :untrash
    end
  end


  resources :shifts
  resources :calendar
  
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"

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



end
