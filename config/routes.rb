Rails.application.routes.draw do
  resources :boards do
    resources :columns do
      resources :tasks do
        patch 'move', on: :member
      end
    end
  end

  root "boards#index"
end
