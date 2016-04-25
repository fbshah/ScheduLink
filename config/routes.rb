Rails.application.routes.draw do

  devise_for :users, :controllers => {:registrations => "users/registrations" }
    devise_scope :users do
    get '/login' => 'devise/sessions#new'
    get '/logout' => 'devise/sessions#destroy'
  end
  resources :users, :controller => "users"

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
  resources :events
  resources :requests

  get 'about'   => 'static_pages#about'
  get 'faq' => 'static_pages#faq'
  root 'welcome#index'

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


end
