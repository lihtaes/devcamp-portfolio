Rails.application.routes.draw do
  
# resources pre-configured with generation of respective scaffolds
  resources :portfolios, except: [:show]
  get 'portfolio/:id', to: 'portfolios#show', as: 'portfolio_show'

  resources :blogs


# declaring the route on the left, and mapping it on the right
  get '/about-me', to: 'pages#about' 
  get '/contact', to: 'pages#contact'

  root to: 'pages#home'

end
