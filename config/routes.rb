Rails.application.routes.draw do

  root 'customers#new'

  controller :sessions do
    get 'login' => :new
    post 'login' => :create
    delete 'logout' => :destroy
  end
  resources :customers, except: [:index]
  resources :restaurants do
    resources :reservations
  end

end