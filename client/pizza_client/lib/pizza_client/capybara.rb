module PizzaClient
  class Browser
    include ::Capybara::DSL

    def initialize
      init
    end

    private

    def init
      Capybara.run_server = false
      Capybara.register_driver(:chrome) do |app|
        Capybara::Selenium::Driver.new(app, browser: :chrome)
      end
      Capybara.current_driver = :chrome
    end
  end
end
