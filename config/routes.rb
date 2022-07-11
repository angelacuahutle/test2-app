Rails.application.routes.draw do
  resources :employees do
    collection do
      post :preview
    end
  end
  root "employees#index"
end
