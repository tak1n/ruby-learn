require 'pony'

Pony.mail(:to => 'benjamin.klotz@holzweg2.com', :from => 'benny@localhost.com', :subject => 'hi', :body => 'hi body')
