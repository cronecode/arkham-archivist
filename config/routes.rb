Rails.application.routes.draw do
  root 'static_pages#home'

  namespace :api do
    resources :campaigns do
      resources :scenarios
      resources :investigators
    end
  end

  resources :campaigns do
    resources :scenarios
    resources :investigators
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # root 'application#hello'
end
