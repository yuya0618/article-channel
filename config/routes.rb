Rails.application.routes.draw do
  root to: 'articles#index'

  resources :articles do
    resources :relations
    resources :heads
    resources :texts
  end

end
