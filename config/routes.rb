SimpleSupport::Application.routes.draw do
  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'
  devise_for :users, controllers: {
      sessions: 'users/sessions',
      registrations: 'users/registrations'
  }

  root 'dashboard#index'
  resources :tickets, only: [:index, :show, :new, :create]
  resources :support_areas, only: [] do
    resources :tickets, only: [:index]
  end
  resources :ticket_comments, only: [:create]
end
