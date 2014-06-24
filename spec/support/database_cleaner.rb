RSpec.configure do |configuration|
  configuration.before(:suite) do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with(:truncation)
  end

  configuration.around(:each) do |example|
    DatabaseCleaner.cleaning do
      example.run
    end
  end
end
