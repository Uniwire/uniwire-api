# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  namespace :v1, defaults: { format: :json } do
    resources :events
    resources :risk_areas
    resources :student_residences
    resources :establishments
  end

  scope path: ApplicationResource.endpoint_namespace, module: 'v2', defaults: { format: :jsonapi } do
    resources :student_residences
  end
end
