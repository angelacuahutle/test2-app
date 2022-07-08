Rails.application.routes.draw do
  resources :employees do
  end
  root "employees#index"
end
