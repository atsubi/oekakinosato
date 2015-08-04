#!/root/.rbenv/shims/ruby
# -*- coding: utf-8 -*-

require 'cgi'
require 'cgi/session'

cgi = CGI.new
session = CGI::Session.new(cgi)
number = session['number']
#header = cgi.header( {"charset"=>"UTF-8"} )
#puts header

begin
  cgi.out{ "#{number}" }
rescue
  cgi.out{ "error" }
end
