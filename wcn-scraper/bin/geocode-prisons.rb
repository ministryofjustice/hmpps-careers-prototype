#!/usr/bin/env ruby

# This script takes a list of prison names and uses the Google geocoding API
# to find a latitude and longitude for them.
#
# To use it, capture its output into a file and then post-process in a text
# editor, then update the list in `lib/wcn-scraper/location.rb`
#
# NB: You will need a valid GOOGLE_MAPS_API_KEY in the environment.

require 'uri'

# https://developers.google.com/maps/documentation/geocoding/intro#BYB
api_key = ENV.fetch("GOOGLE_MAPS_API_KEY")
url_template = 'https://maps.googleapis.com/maps/api/geocode/json?address=%s&key=' + api_key

# This list comes from piping the pretty-printed output of the current vacancies script
# through; `grep title | sed 's/.*HM/HM/'` plus a bit of manual cleaning up.
# i.e. this is all the prisons that were mentioned in the vacancies on 03/07/17
prisons = [
  'HMP Berwyn',
  'HMP Brixton',
  'HMP Bure',
  'HMP Cardiff',
  'HMP Channings Wood',
  'HMP Chelmsford',
  'HMP Coldingley',
  'HMP Dartmoor',
  'HMP Eastwood Park',
  'HMP Erlestoke',
  'HMP Featherstone',
  'HMP Grendon',
  'HMP Guys Marsh',
  'HMP Haverigg',
  'HMP Hewell',
  'HMP High Down',
  'HMP Highpoint',
  'HMP Hollesley Bay',
  'HMP Humber',
  'HMP Huntercombe',
  'HMP Kirkham',
  'HMP Leicester',
  'HMP Leyhill',
  'HMP Lincoln and IRC Morton Hall',
  'HMP Littlehey',
  'HMP Long Lartin',
  'HMP Low Newton',
  'HMP Maidstone',
  'HMP Norwich',
  'HMP Onley',
  'HMP Ranby',
  'HMP Stocken',
  'HMP Swaleside',
  'HMP The Mount',
  'HMP Usk/Prescoed',
  'HMP Wandsworth',
  'HMP Wayland',
  'HMP Whatton',
  'HMP Whitemoor',
  'HMP Winchester',
  'HMP Woodhill',
  'HMP/YOI Bedford',
  'HMP/YOI Downview',
  'HMP/YOI Drake Hall',
  'HMP/YOI Foston Hall',
  'HMP/YOI Isis',
  'HMP/YOI Isle of Wight',
  'HMP/YOI Lewes',
  'HMP/YOI Send',
  'HMP/YOI Wormwood Scrubs',
  'HMYOI Aylesbury',
  'HMYOI Cookham Wood',
  'HMYOI Deerbolt',
  'HMYOI Feltham',
  'HMYOI Portland & IRC Verne',
  'HMYOI Stoke Heath',
  'HMYOI Swinfen Hall'
]

prisons.each do |prison|
  url = url_template % URI.encode(prison)
  json = `curl #{url}`
  puts "PRISON: #{prison}"
  puts json
  sleep 0.2  # don't exceed the usage quota for the google api
end

