Rails.application.routes.draw do

 
match '/check_email' =>"requests#check_email", :via => :post, :as => :chk_email
match '/check_crossplatform' =>"requests#check_crossplatform", :via => :post, :as => :check_crossplatform
 match '/check_schedule' =>"requests#check_schedule", :via => :post, :as => :check_schedule
  resources :rooms
  resources :staffs
      devise_for :users, controllers: {
        sessions: 'users/sessions',
        registrations: 'users/registrations'
  
      }
      get 'requests/edit/', to: 'requests#edit'
      get 'admin/reschedule'
  get 'admin/approved'
  get 'admin/pending'
  get 'admin/index'

  get 'admin/list'

  get 'admin/setting'

  get 'index/dashboard'
  get 'test', to: 'index#test'
get 'requests/status/', to: 'requests#status', as: 'status'
  resources :requests
 # resources :users
  root to: 'index#dashboard'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
