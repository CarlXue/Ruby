require 'open-uri'
require 'json'
require 'net/http'
require 'ap'

# Define the URL
URL = 'http://www.matblair.com'

# Define the HTTP object
uri = URI.parse(URL)
http = Net::HTTP.new(uri.host, uri.port)
# If the api being scraped uses https, then set use_ssl to true.
# http.use_ssl = true

# Define the request_url
request_url = '/resume.json'
# Make a GET request to the given url
response = http.send_request('GET', request_url)

# Parse the response body
response_json = JSON.parse(response.body)

response_json.each_pair do |key,value|
	puts "#{key}: #{value}"
end

response_json['key_name']
