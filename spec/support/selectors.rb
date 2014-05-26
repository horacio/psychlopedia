module Selectors
  Capybara.add_selector(:href) do
    xpath do |href|
      ".//a[@href='#{href}']"
    end
  end
end
