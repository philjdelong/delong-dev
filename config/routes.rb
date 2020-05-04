Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get "/", to: "phil_delong#index"
  get "/projects", to: "projects#index"
  get "/career", to: "career#index"
  get "/education", to: "education#index"
end
