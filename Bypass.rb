require 'net/http'
require 'openssl'

class Dammi < Net::HTTPRequest
  METHOD = "DAMMI"
  REQUEST_HAS_BODY = false
  RESPONSE_HAS_BODY = true
end

uri = URI.parse('https://profilemanager.holzweg.tv')

http = Net::HTTP.new(uri.host, uri.port)
http.use_ssl = true
http.verify_mode = OpenSSL::SSL::VERIFY_NONE

r_a = http.request(Dammi.new('/'))
puts r_a.body