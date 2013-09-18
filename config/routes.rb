SimpleSupport::Application.routes.draw do
  devise_for :users, :controllers => { :sessions => 'users/sessions'}
  root 'dashboard#index'
end
