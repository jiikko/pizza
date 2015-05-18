require 'capybara/dsl'
require "selenium-webdriver"

module Service
  class Base
    include ::Capybara::DSL

    def initialize
      init
      login
    end

    def login
      raise("サブクラスで実装頼む")
    end

    private

    def init
      Capybara.reset_sessions!
      Capybara.run_server = false
      Capybara.register_driver(:chrome) do |app|
        Capybara::Selenium::Driver.new(app, browser: :chrome)
      end
      Capybara.current_driver = :chrome
    end
  end
end
