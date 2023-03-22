Rails.application.routes.draw do
  resources :employees do
    collection do
      post :personal_data
      get :preview
    end
  end
  root "employees#index"
end
