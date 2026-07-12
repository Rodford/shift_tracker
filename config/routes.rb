Rails.application.routes.draw do
  devise_for :users
  root "shifts#index"
  
  resources :shifts do
    resources :tasks do
      # ADD THIS MEMBER BLOCK
      member do
        patch :toggle
      end
    end
  end
end