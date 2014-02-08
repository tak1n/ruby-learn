require 'net/imap'

  imap = Net::IMAP.new('imap.googlemail.com', 993, usessl = true, certs = nil, verify = false)
  puts imap

