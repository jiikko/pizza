require "pizza_client"
require 'thor'
require 'json'
require 'open-uri'
require 'capybara'
require 'capybara/dsl'
require "selenium-webdriver"

module PizzaClient
  class CLI < Thor
    include Capybara::DSL

    desc "exec script", "to http"
    def operation(name)
      Capybara.run_server = false
      Capybara.configure do |config|
        config.run_server = false
        config.default_driver = :selenium
        config.app_host = 'http://google.com'
      end
      Capybara.register_driver :selenium do |app|
        Capybara::Selenium::Driver.new(app, browser: :chrome)
      end

      visit('/')

      # open("#{HOST}/operations/search?name=#{name}") do |response|
      #   x = JSON.parse(response.read)["script"] # eval
      #   puts x
      # end
    end

    desc "get script list", "to http"
    def fetch
    end
  end
end

