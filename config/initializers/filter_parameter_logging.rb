# frozen_string_literal: true

# Be sure to restart your server when you modify this file.

# Configure sensitive parameters which will be filtered from the log file.

# Although we don't have the user table yet, this is an example of a sensitive variable to use in sentry.
Rails.application.config.filter_parameters += [:password]
