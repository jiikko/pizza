require 'thor'
require 'json'
require 'open-uri'
require 'capybara/dsl'
require "selenium-webdriver"
require "pizza_client"
require "pizza_client/capybara"

module PizzaClient
  class CLI < Thor
    desc "exec script", "to http"
    def operation(name)
      capyvara = PizzaClient::Browser.new
      capyvara.visit('http://google.com')

      # open("#{HOST}/operations/search?name=#{name}") do |response|
      #   x = JSON.parse(response.read)["script"] # eval
      #   puts x
      # end
    end

    desc "get script list", "to http"
    def fetch
    end

    desc "exec script", "to http"
    def service(service_name, method, option)
      puts "hei"
      params = "service_name=#{service_name}&method=#{method}&option=#{option}"
      open("#{HOST}/ajax/services/exec?#{params}") do |response|
        puts JSON.parse(response.read)
      end
    end
  end
end

