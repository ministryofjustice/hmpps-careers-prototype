#!/usr/bin/env ruby

require_relative '../lib/wcn-scraper'

RSS_URL = 'https://justicejobs.tal.net/vx/mobile-0/appcentre-1/brand-2/candidate/jobboard/vacancy/3/feed'

def main
  feed = get_rss_content
  vacancies = get_vacancies(feed, /prison.officer/i)
  output_vacancies vacancies
end

def get_rss_content
  rss = Net::HTTP.get(URI.parse(RSS_URL))
  RSS::Parser.parse(rss)
end

def get_vacancies(rss_feed, regexp)
  rss_feed.items.find_all do |item|
    !regexp.match(item.title.content).nil?
  end
end

def output_vacancies(vacancies)
  list = vacancies.collect do |vacancy|
    WcnScraper::Vacancy.new(vacancy.id.base, vacancy.content.content).attrs()
  end
  puts list.to_json
end

main
