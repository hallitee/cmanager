Rails.application.routes.draw do

  resources :configs
match '/get_events' =>"index#get_events", :via => :post, :as => :get_events
match '/check_email' =>"requests#check_email", :via => :post, :as => :chk_email
match '/check_crossplatform' =>"requests#check_crossplatform", :via => :post, :as => :check_crossplatform
 match '/check_schedule' =>"requests#check_schedule", :via => :post, :as => :check_schedule
 match '/check_attendees' =>"requests#check_attendees", :via => :post, :as => :check_attendees


 # authenticated :users do
  #resources :requests, only: [:new, :status, :index, :show, :create, :edit, :update, :destroy]
  #end
#resources :requests, only: [:index, :show]
      devise_for :users, controllers: {
        sessions: 'users/sessions',
        registrations: 'users/registrations',
        passwords: 'users/passwords'

      }
authenticated :user do
  root to: 'admin#index', as: :authenticated_root
end
  get 'requests/edit/', to: 'requests#edit'
  get 'admin/reschedule'
  get 'admin/approved'
  get 'admin/pending'
  get 'admin/index'
  get 'admin/manager'
  get 'admin/user'  
  get 'admin/list'

  get 'admin/setting'

  get 'index/dashboard'
  get 'test', to: 'index#test'
get 'requests/status/', to: 'requests#status', as: 'status'
 
  resources :rooms
  resources :staffs
  resources :requests
 # resources :users
  root to: 'index#dashboard'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
