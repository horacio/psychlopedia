RSpec.configure do |configuration|
  configuration.before(:suite) do
    DatabaseCleaner.strategy = :truncation
    DatabaseCleaner.clean_with(:truncation)
  end

  configuration.before(:each) do
    DatabaseCleaner.start
  end

  configuration.after(:each) do
    DatabaseCleaner.clean
  end
end
