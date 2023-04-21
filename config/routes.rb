Rails.application.routes.draw do
  resources :kinds

  resources :contacts do
    resource :kind, only: %i[show]
    resource :kind, only: %i[show], path: 'relationships/kind'
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
