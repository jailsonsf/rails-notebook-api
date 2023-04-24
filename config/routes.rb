Rails.application.routes.draw do
  resources :kinds

  resources :contacts do
    resource :kind, only: %i[show]
    resource :kind, only: %i[show], path: 'relationships/kind'

    resource :phones, only: %i[show]
    resource :phones, only: %i[show], path: 'relationships/phones'

    resource :phone, only: %i[update create destroy]
    resource :phone, only: %i[update create destroy], path: 'relationships/phone'

    resource :address, only: %i[show update create destroy]
    resource :address, only: %i[show update create destroy], path: 'relationships/addr:address'
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
