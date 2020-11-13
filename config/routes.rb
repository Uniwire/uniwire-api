# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users

  namespace :v1, defaults: { format: :json } do
    resources :events
    resources :risk_areas
    resources :student_residences
    resources :establishments
  end
end
