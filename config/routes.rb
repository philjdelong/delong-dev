Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get "/", to: "phil_delong#about"
  get "/projects", to: "phil_delong#projects"
  get "/career", to: "phil_delong#career"
  get "/education", to: "phil_delong#education"
  
  get "/resume", to: "phil_delong#resume"
  get "/pdf", to: "phil_delong#pdf"

  get "/register", to: "users#new"
  get "/login", to: "sessions#new"
end
