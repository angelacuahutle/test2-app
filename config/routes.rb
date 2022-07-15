Rails.application.routes.draw do
  resources :employees do
    collection do
      post :preview
      post :personal_data
    end
  end
  root "employees#index"
end
