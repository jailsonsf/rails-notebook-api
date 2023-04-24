Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'
  resources :kinds

  api_version(module: 'V1', path: { value: 'v1' }) do
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
  end

  api_version(module: 'V2', path: { value: 'v2' }) do
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
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
