Rails.application.routes.draw do
  
  devise_for :users, path: '', path_names: {sign_in: 'login', sign_out: 'logout', sign_up: 'register'}
# resources pre-configured with generation of respective scaffolds
  resources :portfolios, except: [:show]
  get 'portfolio/:id', to: 'portfolios#show', as: 'portfolio_show'

  resources :blogs do
    member do
      get :toggle_status
    end
  end


# declaring the route on the left (what is accepted by the URL), and mapping it on the right (which controller it goes to, and which method in that controller)
  get '/about-me', to: 'pages#about' 
  get '/contact', to: 'pages#contact'


  #******SCOPE EXAMPLE********
  #So here we route the url "scope-items" into the portfolios controller right 
  #into the scope method, where the rest of the magic can happen...  Check out 
  #the controller for more.
  get 'scope-items', to: 'portfolios#scope'
#************END SCOPE EXAMPLE IN ROUTE FILE****


  root to: 'pages#home'

end
