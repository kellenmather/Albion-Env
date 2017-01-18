Rails.application.routes.draw do



# DISPLAY ROUTES
root 'displays#index'
get '/projects' => 'displays#projects'
get '/about' => 'displays#about'
get '/methods' => 'displays#methods'
resources :sessions, only: [:create, :destroy, :new, :show]
resources :quotes, only: [:new,:create]
resources :users, :results
post '/results/find'=> 'results#show'

	




  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
