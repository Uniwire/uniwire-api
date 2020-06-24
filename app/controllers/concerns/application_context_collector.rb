# frozen_string_literal: true

# This concern is responsible for collecting the as much context data about the application environment as possible
# when an error happens.

module ApplicationContextCollector
  extend ActiveSupport::Concern

  def collect_application_context
    Raven.extra_context(params: params.to_unsafe_hash, url: request.url, request_uuid: request.uuid)
  end
end
