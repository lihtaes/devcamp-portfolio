Rails.application.routes.draw do
  
# resources pre-configured with generation of respective scaffolds
  resources :portfolios
  resources :blogs


# declaring the route on the left, and mapping it on the right
  get '/about-me', to: 'pages#about' 
  get '/contact', to: 'pages#contact'


  root to: 'pages#home'

end
