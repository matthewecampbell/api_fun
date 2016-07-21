require 'pp'
require 'pry'
require 'Faraday'
require 'JSON'

section = ARGV[0].downcase.strip
response = Faraday.get("https://api.nytimes.com/svc/topstories/v2/#{section}.json?api-key=f15dc5fcbf884c78997b063cbdeeab4e")
data = JSON.parse(response.body, object_class: OpenStruct)
article = data.results.first
puts article.title
puts article.byline
puts article.published_date
puts article.abstract
puts article.url
