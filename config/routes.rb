Rails.application.routes.draw do
  get 'users/:id/shifts' => 'users#shifts', :as => :user_shifts
  resources :shifts
  resources :calendar
  resources :events
  get 'about'   => 'static_pages#about'
  get 'faq' => 'static_pages#faq'
  root 'welcome#index'

  resource :calendar, only: [:show], controller: :calendar
  devise_for :users, :controllers => {:registrations => "users/registrations" }
  resources :users
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



end
