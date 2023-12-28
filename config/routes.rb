Rails.application.routes.draw do


  # root "employees#sign_up"
  root "welcome#index"
  # root  "employees#index"
  # root "companies#index"
  # root "employees#index"

  # root "devise/registrations#new"
  
  devise_for :employees
  resources :employees
  resources :departments  
  resources :companies
  
  # resources :departments do
  #   devise_for :employees, path: employees
  # end



#   resources :departments do
#   resources :employees, only: [:new, :create]
# end

  # resources :companies do
  #   resources :departments
  # end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end


