require 'bundler/setup'
require 'rss'
require 'awesome_print'
require 'pp'
require 'pry-byebug'
require 'net/http'
require 'uri'
require 'json'

module WcnScraper
end

require_relative './wcn-scraper/vacancy'
require_relative './wcn-scraper/location'
