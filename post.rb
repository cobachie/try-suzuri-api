require 'net/http'
require 'uri'
require 'json'
require 'dotenv/load'

token = ENV['ACCESS_TOKEN']
uri = URI.parse('https://suzuri.jp/api/v1/materials')
http = Net::HTTP.new(uri.host, uri.port)
http.use_ssl = true

headers = {
  'Authorization': "Bearer #{token}",
  'Content-Type': 'application/json'
}

image_url = ENV['IMAGE_URL']
params = {
  "texture": image_url,
  "title": "test",
  "price": 100,
  "description": "test",
  "products": [
    {
      "itemId": 147,
      "published": true
    }
  ]
}

response = http.post(uri.path, params.to_json, headers)
pp response.code
pp response.body
