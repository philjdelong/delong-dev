Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get "/", to: "phil_delong#about"
  get "/projects", to: "phil_delong#projects"
  get "/career", to: "phil_delong#career"
  get "/education", to: "phil_delong#education"
  get "/game", to: "phil_delong#game"

  post "/games/create", to: "games#create"
  get "/games/higher", to: "games#higher"
  get "/games/lower", to: "games#lower"
  
  get "/reset_stats", to: "games#reset_stats"
  
  get "/resume", to: "phil_delong#resume"
  get "/pdf", to: "phil_delong#pdf"

  get "/login", to: "sessions#new"
  post "/auth", to: "sessions#create"
  get "/logout", to: "sessions#delete"

  get "/users/register", to: "users#new"
  post "/users", to: "users#create"
  
  get "/:slug/profile", to: "users#profile"
  get "/:slug/edit", to: "users#edit"
  patch "/:slug", to: "users#update"
  delete "/:slug", to: "users#delete"
end
