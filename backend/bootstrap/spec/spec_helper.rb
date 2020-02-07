require "bundler/setup"
require "bootstrap"

$LOAD_PATH.unshift File.expand_path("../../lib", __FILE__)

Dir["./spec/support/**/*.rb"].sort.each { |f| require f }

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"
  # config.expose_dsl_globally = true

  # Disable RSpec exposing methods globally on `Module` and `main`

  # config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end
