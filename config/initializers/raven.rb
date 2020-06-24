# frozen_string_literal: true

# Configure sensitive parameters which will be filtered from the error exceptions.
Raven.configure do |config|
  config.dsn = ENV['SENTRY_DSN']
  config.sanitize_fields = Rails.application.config.filter_parameters.map(&:to_s)
  config.environments = %w(qa stage production)
end
