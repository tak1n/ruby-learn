require "net/http"
require "uri"
require 'json'
require 'openssl'

url = URI.parse("http://localhost:9292/test")
params = { :name => "ruby" }

req = Net::HTTP::Post.new(url.path)
req.set_form_data(params)

puts req.inspect

puts Time.now.to_f.round(2).inspect
puts Time.now.to_i
message = { 'method' => 'POST', 'date' => Time.now.to_i, 'data' => params }.to_json

hash = OpenSSL::HMAC.hexdigest(OpenSSL::Digest.new('sha256'), 'test_secret', message)

req.add_field("AUTHORIZATION", "#{hash}:test_signature")

res = Net::HTTP.new(url.host, url.port).start do |http|
    http.request(req)
end

puts res.body

