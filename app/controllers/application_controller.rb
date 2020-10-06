# frozen_string_literal: true

class ApplicationController < ActionController::API
  include ApplicationContextCollector

  before_action :collect_application_context

  rescue_from ActiveRecord::RecordNotFound, with: :resource_not_found

  private

  def resource_not_found
    head :not_found
  end
end
