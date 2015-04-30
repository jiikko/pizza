require "pizza_client"
require 'thor'
require 'json'
require 'open-uri'

module PizzaClient
  class CLI < Thor
    desc "exec script", "to http"
    def operation(name)
      open("#{HOST}/operations/search?name=#{name}") do |response|
        x = JSON.parse(response.read)["script"] # eval
        puts x
      end
    end

    desc "get script list", "to http"
    def fetch
    end
  end
end

