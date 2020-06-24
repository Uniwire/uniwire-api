class ApplicationController < ActionController::API
  include ApplicationContextCollector

  before_action :collect_application_context
end
