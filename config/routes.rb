# frozen_string_literal: tru

Rails.application.routes.draw do
  devise_for :users

  root 'home#index'
  resources :deposits, only: %i[index new create]
  resources :withdrows, only: %i[index new create]
end
