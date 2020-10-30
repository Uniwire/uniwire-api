# frozen_string_literal: true

class APIController < ::ActionController::API
  include ApplicationContextCollector
  include Graphiti::Rails::Responders

  before_action :collect_application_context
end


