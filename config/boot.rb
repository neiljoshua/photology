ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../Gemfile', __dir__)

require 'logger'
require 'uri'

# Patch legacy URI.escape removal in Ruby 3.x for older gems/helpers
unless URI.respond_to?(:escape)
  module URI
    def self.escape(*args)
      DEFAULT_PARSER.escape(*args)
    end
  end
end

require "bundler/setup" # Set up gems listed in the Gemfile.
