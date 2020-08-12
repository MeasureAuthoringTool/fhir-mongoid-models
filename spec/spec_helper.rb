require_relative './simplecov_init'
require 'bundler/setup'
require 'fhir/mongoid/models'
require 'json'

Mongoid.load!('config/mongoid.yml', :test)

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = '.rspec_status'

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

  config.before(:example) do
    dump_database
  end
end

def dump_database
  Mongoid.default_client.collections.each(&:drop)
end
