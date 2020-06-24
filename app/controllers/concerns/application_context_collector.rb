# frozen_string_literal: true

# This concern is responsable to collect the most possible context data about the Application enviroment data
# when an error happens.

# Example
#  class MyController
#    include ApplicationContextCollector
#
#    before_action :collect_application_context
#
#  end

module ApplicationContextCollector
  extend ActiveSupport::Concern

  def collect_application_context
    Raven.extra_context(params: params.to_unsafe_hash, url: request.url, request_uuid: request.uuid)
  end
end
